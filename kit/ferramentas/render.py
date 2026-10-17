"""Gera o PNG de um molde HTML do kit.

Uso: python render.py <arquivo.html> <saida.png> [largura] [altura]
Padrão 1080x1350 (post do feed). Capa de Reels/Stories: 1080 1920.
"""
import os
import sys

from playwright.sync_api import sync_playwright

CHROMIUM = "/opt/pw-browsers/chromium-1194/chrome-linux/chrome"

src, out = os.path.abspath(sys.argv[1]), sys.argv[2]
w = int(sys.argv[3]) if len(sys.argv) > 3 else 1080
h = int(sys.argv[4]) if len(sys.argv) > 4 else 1350

with sync_playwright() as p:
    kwargs = {"executable_path": CHROMIUM} if os.path.exists(CHROMIUM) else {}
    browser = p.chromium.launch(**kwargs)
    page = browser.new_page(viewport={"width": w, "height": h})
    page.goto("file://" + src)
    page.wait_for_load_state("networkidle")
    page.evaluate("document.fonts.ready")
    page.wait_for_timeout(500)
    page.screenshot(path=out)
    browser.close()
