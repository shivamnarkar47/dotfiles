#!/usr/bin/env python3
import json, sys, time, threading, subprocess
from urllib.request import Request, urlopen

STOCKS = ["AAPL", "GOOGL", "MSFT", "NVDA"]
STOCK_INTERVAL = 60
BATTERY = "/sys/class/power_supply/BAT0"
REFRESH = 5

stock_data = {}
stock_lock = threading.Lock()
last_fetch = 0

def bat_block():
    try:
        c = int(open(f"{BATTERY}/capacity").read())
        s = open(f"{BATTERY}/status").read().strip()
    except Exception:
        return None
    charging = s == "Charging"
    if charging:
        icon = "\uf0e7"
        color = "#a6e3a1"
    elif c >= 90:
        icon = "\uf240"
        color = "#a6e3a1"
    elif c >= 60:
        icon = "\uf241"
        color = "#a6e3a1"
    elif c >= 30:
        icon = "\uf242"
        color = "#fab387"
    elif c >= 15:
        icon = "\uf243"
        color = "#fab387"
    else:
        icon = "\uf244"
        color = "#f38ba8"
    return {"name": "battery", "instance": s.lower(), "full_text": f"{icon} {c}%", "color": color}

def fetch_stocks():
    global stock_data, last_fetch
    t = time.time()
    if t - last_fetch < STOCK_INTERVAL:
        return
    for sym in STOCKS:
        try:
            req = Request(
                f"https://query1.finance.yahoo.com/v8/finance/chart/{sym}",
                headers={"User-Agent": "Mozilla/5.0"},
            )
            d = json.loads(urlopen(req, timeout=10).read())
            r = d["chart"]["result"][0]
            p = r["meta"]["regularMarketPrice"]
            prev = r["meta"]["chartPreviousClose"]
            ch = p - prev
            pc = (ch / prev) * 100
            arr = "\u25b2" if ch >= 0 else "\u25bc"
            with stock_lock:
                stock_data[sym] = (p, arr, abs(ch), abs(pc))
        except Exception:
            pass
    last_fetch = time.time()

def stock_blocks():
    b = []
    with stock_lock:
        for sym in STOCKS:
            if sym in stock_data:
                p, arr, ch, pc = stock_data[sym]
                col = "#a6e3a1" if arr == "\u25b2" else "#f38ba8"
                b.append({
                    "name": f"stk_{sym.lower()}",
                    "instance": sym,
                    "full_text": f"{sym} ${p:.2f}",
                    "color": col,
                    "separator": True,
                })
    return b

def clicks():
    while True:
        l = sys.stdin.readline()
        if not l:
            break
        try:
            e = json.loads(l.strip())
            n = e.get("name", "")
            if n == "battery":
                subprocess.Popen(["alacritty", "-e", "acpi", "-i"])
            elif n.startswith("stk_"):
                subprocess.Popen([
                    "xdg-open",
                    f"https://finance.yahoo.com/quote/{e.get('instance', '')}",
                ])
        except Exception:
            pass

def main():
    print(json.dumps({"version": 1, "click_events": True}))
    print("[", flush=True)
    print("[]", flush=True)
    threading.Thread(target=clicks, daemon=True).start()
    while True:
        b = []
        bt = bat_block()
        if bt:
            b.append(bt)
        fetch_stocks()
        b += stock_blocks()
        b.append({
            "name": "time",
            "full_text": time.strftime("%a %b %d %H:%M"),
            "separator": False,
            "color": "#cdd6f4",
        })
        print(f",{json.dumps(b)}", flush=True)
        time.sleep(REFRESH)

if __name__ == "__main__":
    main()
