
c.load_autoconfig()

c.zoom.levels = ["10", "20", "30", "40", "50", "60", "70", "80", "90", "100", "110", "120", "130", "140", "150", "160", "170", "180", "190", "200", "210", "220", "230", "240", "250"]

c.url.searchengines['DEFAULT'] = "https://search.inetol.net/search?q={}"
c.url.searchengines['gh'] = "https://github.com/search?q={}"
c.url.searchengines['in'] = "https://cal1.iv.ggtyler.dev/search?q={}"
c.url.searchengines['np'] = "https://search.nixos.org/packages?channel=24.05&query={}"
c.url.searchengines['od'] = "https://odysee.com/$/search?q={}"
c.url.searchengines['pi'] = "https://cal1.pi.ggtyler.dev/results?search_query={}"

c.bind("0", "tab-select 10", mode="normal")
c.bind("1", "tab-select 1", mode="normal")
c.bind("2", "tab-select 2", mode="normal")
c.bind("3", "tab-select 3", mode="normal")
c.bind("4", "tab-select 4", mode="normal")
c.bind("5", "tab-select 5", mode="normal")
c.bind("6", "tab-select 6", mode="normal")
c.bind("7", "tab-select 7", mode="normal")
c.bind("8", "tab-select 8", mode="normal")
c.bind("9", "tab-select 9", mode="normal")

c.bind("=", "zoom-in -q", mode="normal")
c.bind("-", "zoom-out -q", mode="normal")

c.bind("aa", "hint all yank", mode="normal")
c.bind("aj", "hint all hover", mode="normal")
c.bind("as", "hint all delete", mode="normal")

c.bind("e", "tab-close", mode="normal")

c.bind("xe", "config-cycle colors.webpage.darkmode.enabled true false", mode="normal")
c.bind("xt", "config-cycle tabs.position top right", mode="normal")
c.bind("xx", "config-cycle tabs.show multiple never", mode="normal")


import theme
theme.setup(c, 'mocha', True)

