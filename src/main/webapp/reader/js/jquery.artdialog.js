/*!
 * artDialog 4.1.2
 * Date: 2011-09-04 30:36
 * http://code.google.com/p/artdialog/
 * (c) 2009-2011 TangBin, http://www.planeArt.cn
 *
 * This is licensed under the GNU LGPL, version 2.1 or later.
 * For details, see: http://creativecommons.org/licenses/LGPL/2.1/
 */
(function(e, t, n) {
    e.noop = e.noop || function() {};
    var r, i, s, o, u = 0,
        a = e(t),
        f = e(document),
        l = e("html"),
        c = e(function() {
            c = e("body")
        }),
        h = document.documentElement,
        p = t.VBArray && !t.XMLHttpRequest,
        d = "createTouch" in document && !("onmousemove" in h) || /(iPhone|iPad|iPod)/i.test(navigator.userAgent),
        v = "artDialog" + (new Date).getTime(),
        m = function(t, i, s) {
            t = t || {};
            if (typeof t == "string" || t.nodeType === 1) t = {
                content: t,
                fixed: !d
            };
            var o, a = [],
                f = m.defaults,
                l = t.follow = this.nodeType === 1 && this || t.follow;
            for (var c in f) t[c] === n && (t[c] = f[c]);
            return e.each({
                ok: "yesFn",
                cancel: "noFn",
                close: "closeFn",
                init: "initFn",
                okVal: "yesText",
                cancelVal: "noText"
            }, function(e, r) {
                t[e] = t[e] !== n ? t[e] : t[r]
            }), typeof l == "string" && (l = e(l)[0]), t.id = l && l[v + "follow"] || t.id || v + u, o = m.list[t.id], l && o ? o.follow(l).focus() : o ? o.focus() : (d && (t.fixed = !1), e.isArray(t.button) || (t.button = t.button ? [t.button] : []), i !== n && (t.ok = i), s !== n && (t.cancel = s), t.ok && t.button.push({
                name: t.okVal,
                callback: t.ok,
                focus: !0
            }), t.cancel && t.button.push({
                name: t.cancelVal,
                callback: t.cancel
            }), m.defaults.zIndex = t.zIndex, u++, m.list[t.id] = r ? r._init(t) : new m.fn._init(t))
        };
    m.fn = m.prototype = {
        version: "4.1.2",
        _init: function(e) {
            var n = this,
                i, s = e.icon,
                o = s && (p ? {
                    png: "icons/" + s + ".png"
                } : {
                    backgroundImage: "url('" + e.path + "/skins/icons/" + s + ".png')"
                });
            return n._isRun = !0, n.config = e, n.DOM = i = n.DOM || n._getDOM(), i.wrap.addClass(e.skin), i.close[e.cancel === !1 ? "hide" : "show"](), i.icon[0].style.display = s ? "" : "none", i.iconBg.css(o || {
                background: "none"
            }), i.se.css("cursor", e.resize ? "se-resize" : "auto"), i.title.css("cursor", e.drag ? "move" : "auto"), i.content.css("padding", e.padding), n[e.show ? "show" : "hide"](!0), n.button(e.button).title(e.title).content(e.content, !0).size(e.width, e.height).time(e.time), e.follow ? n.follow(e.follow) : n.position(e.left, e.top), n.focus(e.focus), e.lock && n.lock(), n._addEvent(), n._ie6PngFix(), r = null, e.init && e.init.call(n, t), n
        },
        content: function(e) {
            var t, r, i, s, o = this,
                u = o.DOM,
                a = u.wrap[0],
                f = a.offsetWidth,
                l = a.offsetHeight,
                c = parseInt(a.style.left),
                h = parseInt(a.style.top),
                p = a.style.width,
                d = u.content,
                v = d[0];
            return o._elemBack && o._elemBack(), a.style.width = "auto", e === n ? v : (typeof e == "string" ? d.html(e) : e && e.nodeType === 1 && (s = e.style.display, t = e.previousSibling, r = e.nextSibling, i = e.parentNode, o._elemBack = function() {
                t && t.parentNode ? t.parentNode.insertBefore(e, t.nextSibling) : r && r.parentNode ? r.parentNode.insertBefore(e, r) : i && i.appendChild(e), e.style.display = s, o._elemBack = null
            }, d.html(""), v.appendChild(e), e.style.display = "block"), arguments[1] || (o.config.follow ? o.follow(o.config.follow) : (f = a.offsetWidth - f, l = a.offsetHeight - l, c -= f / 2, h -= l / 2, a.style.left = Math.max(c, 0) + "px", a.style.top = Math.max(h, 0) + "px"), p && p !== "auto" && (a.style.width = a.offsetWidth + "px"), o._autoPositionType()), o._ie6SelectFix(), o._runScript(v), o)
        },
        title: function(e) {
            var t = this.DOM,
                r = t.wrap,
                i = t.title,
                s = "aui_state_noTitle";
            return e === n ? i[0] : (e === !1 ? (i.hide().html(""), r.addClass(s)) : (i.show().html(e || ""), r.removeClass(s)), this)
        },
        position: function(e, t) {
            var r = this,
                i = r.config,
                s = r.DOM.wrap[0],
                o = p ? !1 : i.fixed,
                u = p && r.config.fixed,
                l = f.scrollLeft(),
                c = f.scrollTop(),
                h = o ? 0 : l,
                d = o ? 0 : c,
                v = a.width(),
                m = a.height(),
                g = s.offsetWidth,
                y = s.offsetHeight,
                b = s.style;
            if (e || e === 0) r._left = e.toString().indexOf("%") !== -1 ? e : null, e = r._toNumber(e, v - g), typeof e == "number" ? (e = u ? e += l : e + h, b.left = Math.max(e, h) + "px") : typeof e == "string" && (b.left = e);
            if (t || t === 0) r._top = t.toString().indexOf("%") !== -1 ? t : null, t = r._toNumber(t, m - y), typeof t == "number" ? (t = u ? t += c : t + d, b.top = Math.max(t, d) + "px") : typeof t == "string" && (b.top = t);
            return e !== n && t !== n && (r._follow = null, r._autoPositionType()), r
        },
        size: function(e, t) {
            var n, r, i, s, o = this,
                u = o.config,
                f = o.DOM,
                l = f.wrap,
                c = f.main,
                h = l[0].style,
                p = c[0].style;
            return e && (o._width = e.toString().indexOf("%") !== -1 ? e : null, n = a.width() - l[0].offsetWidth + c[0].offsetWidth, i = o._toNumber(e, n), e = i, typeof e == "number" ? (h.width = "auto", p.width = Math.max(o.config.minWidth, e) + "px", h.width = l[0].offsetWidth + "px") : typeof e == "string" && (p.width = e, e === "auto" && l.css("width", "auto"))), t && (o._height = t.toString().indexOf("%") !== -1 ? t : null, r = a.height() - l[0].offsetHeight + c[0].offsetHeight, s = o._toNumber(t, r), t = s, typeof t == "number" ? p.height = Math.max(o.config.minHeight, t) + "px" : typeof t == "string" && (p.height = t)), o._ie6SelectFix(), o
        },
        follow: function(t) {
            var n, r = this,
                i = r.config;
            if (typeof t == "string" || t && t.nodeType === 1) n = e(t), t = n[0];
            if (!t || !t.offsetWidth && !t.offsetHeight) return r.position(r._left, r._top);
            var s = v + "follow",
                o = a.width(),
                u = a.height(),
                l = f.scrollLeft(),
                c = f.scrollTop(),
                h = n.offset(),
                d = t.offsetWidth,
                m = t.offsetHeight,
                g = p ? !1 : i.fixed,
                y = g ? h.left - l : h.left,
                b = g ? h.top - c : h.top,
                w = r.DOM.wrap[0],
                E = w.style,
                S = w.offsetWidth,
                x = w.offsetHeight,
                T = y - (S - d) / 2,
                N = b + m,
                C = g ? 0 : l,
                k = g ? 0 : c;
            return T = T < C ? y : T + S > o && y - S > C ? y - S + d : T, N = N + x > u + k && b - x > k ? b - x : N, E.left = T + "px", E.top = N + "px", r._follow && r._follow.removeAttribute(s), r._follow = t, t[s] = i.id, r._autoPositionType(), r
        },
        button: function() {
            var t = this,
                r = arguments,
                i = t.DOM,
                s = i.wrap,
                o = i.buttons,
                u = o[0],
                a = "aui_state_highlight",
                f = t._listeners = t._listeners || {},
                l = e.isArray(r[0]) ? r[0] : [].slice.call(r);
            return r[0] === n ? u : (e.each(l, function(n, r) {
                var i = r.name,
                    s = !f[i],
                    o = s ? document.createElement("button") : f[i].elem;
                f[i] || (f[i] = {}), r.callback && (f[i].callback = r.callback), r.className && (o.className = r.className), r.focus && (t._focus && t._focus.removeClass(a), t._focus = e(o).addClass(a), t.focus()), o[v + "callback"] = i, o.disabled = !!r.disabled, s && (o.innerHTML = i, f[i].elem = o, u.appendChild(o))
            }), o[0].style.display = l.length ? "" : "none", t._ie6SelectFix(), t)
        },
        show: function() {
            return this.DOM.wrap.show(), !arguments[0] && this._lockMaskWrap && this._lockMaskWrap.show(), this
        },
        hide: function() {
            return this.DOM.wrap.hide(), !arguments[0] && this._lockMaskWrap && this._lockMaskWrap.hide(), this
        },
        close: function() {
            if (!this._isRun) return this;
            var e = this,
                n = e.DOM,
                i = n.wrap,
                s = m.list,
                o = e.config.close,
                u = e.config.follow;
            e.time();
            if (typeof o == "function" && o.call(e, t) === !1) return e;
            e.unlock(), e._elemBack && e._elemBack(), i[0].className = i[0].style.cssText = "", n.title.html(""), n.content.html(""), n.buttons.html(""), m.focus === e && (m.focus = null), u && u.removeAttribute(v + "follow"), delete s[e.config.id], e._removeEvent(), e.hide(!0)._setAbsolute();
            for (var a in e) e.hasOwnProperty(a) && a !== "DOM" && delete e[a];
            return r ? i.remove() : r = e, e
        },
        time: function(e) {
            var t = this,
                n = t.config.cancelVal,
                r = t._timer;
            return r && clearTimeout(r), e && (t._timer = setTimeout(function() {
                t._click(n)
            }, 1e3 * e)), t
        },
        focus: function() {
            var e, t = this,
                n = t.DOM,
                r = n.wrap,
                i = m.focus,
                s = m.defaults.zIndex++;
            r.css("zIndex", s), t._lockMask && t._lockMask.css("zIndex", s - 1), i && i.DOM.wrap.removeClass("aui_state_focus"), m.focus = t, r.addClass("aui_state_focus");
            if (!arguments[0]) try {
                e = t._focus && t._focus[0] || n.close[0], e && e.focus()
            } catch (o) {}
            return t
        },
        lock: function() {
            if (this._lock) return this;
            var t = this,
                n = m.defaults.zIndex - 1,
                r = t.DOM.wrap,
                i = t.config,
                s = f.width(),
                o = f.height(),
                u = t._lockMaskWrap || e(c[0].appendChild(document.createElement("div"))),
                a = t._lockMask || e(u[0].appendChild(document.createElement("div"))),
                l = "(document).documentElement",
                h = d ? "width:" + s + "px;height:" + o + "px" : "width:100%;height:100%",
                v = p ? "position:absolute;left:expression(" + l + ".scrollLeft);top:expression(" + l + ".scrollTop);width:expression(" + l + ".clientWidth);height:expression(" + l + ".clientHeight)" : "";
            return t.focus(!0), r.addClass("aui_state_lock"), u[0].setAttribute("unselectable", "on"), u[0].setAttribute("onselectstart", "return false"), u[0].setAttribute("style", "-moz-user-select:none;"), u[0].style.cssText = h + ";position:fixed;z-index:" + n + ";top:0;left:0;overflow:hidden;" + v, a[0].style.cssText = "height:100%;background:" + i.background + ";filter:alpha(opacity=0);opacity:0", p && a.html('<iframe src="about:blank" style="width:100%;height:100%;position:absolute;top:0;left:0;z-index:-1;filter:alpha(opacity=0)"></iframe>'), a.stop(), a.bind("click", function() {
                t._reset(), t.shake()
            }).bind("dblclick", function() {
                t.shake()
            }), i.duration === 0 ? a.css({
                opacity: i.opacity
            }) : a.animate({
                opacity: i.opacity
            }, i.duration), t._lockMaskWrap = u, t._lockMask = a, t._lock = !0, t
        },
        unlock: function() {
            var e = this,
                t = e._lockMaskWrap,
                n = e._lockMask;
            if (!e._lock) return e;
            var i = t[0].style,
                s = function() {
                    p && (i.removeExpression("width"), i.removeExpression("height"), i.removeExpression("left"), i.removeExpression("top")), i.cssText = "display:none", r && t.remove()
                };
            return n.stop().unbind(), e.DOM.wrap.removeClass("aui_state_lock"), e.config.duration ? n.animate({
                opacity: 0
            }, e.config.duration, s) : s(), e._lock = !1, e
        },
        _getDOM: function() {
            var t = document.createElement("div");
            t.style.cssText = "position:absolute;left:0;top:0", t.innerHTML = m.templates, document.body.appendChild(t);
            var n, r = 0,
                i = {
                    wrap: e(t)
                },
                s = t.getElementsByTagName("*"),
                o = s.length;
            for (; r < o; r++) n = s[r].className.split("aui_")[1], n && (i[n] = e(s[r]));
            return i
        },
        _toNumber: function(e, t) {
            if (!e && e !== 0 || typeof e == "number") return e;
            var n = e.length - 1;
            return e.lastIndexOf("px") === n ? e = parseInt(e) : e.lastIndexOf("%") === n && (e = parseInt(t * e.split("%")[0] / 100)), e
        },
        _ie6PngFix: p ? function() {
            var e = 0,
                t, n, r, i, s = m.defaults.path + "/skins/",
                o = this.DOM.wrap[0].getElementsByTagName("*");
            for (; e < o.length; e++) t = o[e], n = t.currentStyle.png, n && (r = s + n, i = t.runtimeStyle, i.backgroundImage = "none", i.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='" + r + "',sizingMethod='crop')")
        } : e.noop,
        _ie6SelectFix: p ? function() {
            var e = this.DOM.wrap,
                t = e[0],
                n = v + "iframeMask",
                r = e[n],
                i = t.offsetWidth,
                s = t.offsetHeight;
            i += "px", s += "px", r ? (r.style.width = i, r.style.height = s) : (r = t.appendChild(document.createElement("iframe")), e[n] = r, r.src = "about:blank", r.style.cssText = "position:absolute;z-index:-1;left:0;top:0;filter:alpha(opacity=0);width:" + i + ";height:" + s)
        } : e.noop,
        _runScript: function(e) {
            var t, n = 0,
                r = 0,
                i = e.getElementsByTagName("script"),
                s = i.length,
                o = [];
            for (; n < s; n++) i[n].type === "text/dialog" && (o[r] = i[n].innerHTML, r++);
            o.length && (o = o.join(""), t = new Function(o), t.call(this))
        },
        _autoPositionType: function() {
            this[this.config.fixed ? "_setFixed" : "_setAbsolute"]()
        },
        _setFixed: function() {
            return p && e(function() {
                    var e = "backgroundAttachment";
                    l.css(e) !== "fixed" && c.css(e) !== "fixed" && l.css({
                        backgroundImage: "url(about:blank)",
                        backgroundAttachment: "fixed"
                    })
                }),
                function() {
                    var e = this.DOM.wrap,
                        t = e[0].style;
                    if (p) {
                        var n = parseInt(e.css("left")),
                            r = parseInt(e.css("top")),
                            i = f.scrollLeft(),
                            s = f.scrollTop(),
                            o = "(document.documentElement)";
                        this._setAbsolute(), t.setExpression("left", "eval(" + o + ".scrollLeft + " + (n - i) + ') + "px"'), t.setExpression("top", "eval(" + o + ".scrollTop + " + (r - s) + ') + "px"')
                    } else t.position = "fixed"
                }
        }(),
        _setAbsolute: function() {
            var e = this.DOM.wrap[0].style;
            p && (e.removeExpression("left"), e.removeExpression("top")), e.position = "absolute"
        },
        _click: function(e) {
            var n = this,
                r = n._listeners[e] && n._listeners[e].callback;
            return typeof r != "function" || r.call(n, t) !== !1 ? n.close() : n
        },
        _reset: function(e) {
            var t, n = this,
                r = n._winSize || a.width() * a.height(),
                i = n._follow,
                s = n._width,
                o = n._height,
                u = n._left,
                f = n._top;
            if (e) {
                t = n._winSize = a.width() * a.height();
                if (r === t) return
            }(s || o) && n.size(s, o), i ? n.follow(i) : (u || f) && n.position(u, f)
        },
        _addEvent: function() {
            var e, n = this,
                r = n.config,
                i = "CollectGarbage" in t,
                s = n.DOM;
            n._winResize = function() {
                e && clearTimeout(e), e = setTimeout(function() {
                    n._reset(i)
                }, 40)
            }, a.bind("resize", n._winResize), s.wrap.bind("click", function(e) {
                var t = e.target,
                    i;
                if (t.disabled) return !1;
                if (t === s.close[0]) return n._click(r.cancelVal), !1;
                i = t[v + "callback"], i && n._click(i), n._ie6SelectFix()
            }).bind("mousedown", function() {
                n.focus(!0)
            })
        },
        _removeEvent: function() {
            var e = this,
                t = e.DOM;
            t.wrap.unbind(), a.unbind("resize", e._winResize)
        }
    }, m.fn._init.prototype = m.fn, e.fn.dialog = e.fn.artDialog = function() {
        var e = arguments;
        return this[this.live ? "live" : "bind"]("click", function() {
            return m.apply(this, e), !1
        }), this
    }, m.focus = null, m.list = {}, f.bind("keydown", function(e) {
        var t = e.target,
            n = t.nodeName,
            r = /^INPUT|TEXTAREA$/,
            i = m.focus,
            s = e.keyCode;
        if (!i || !i.config.esc || r.test(n)) return;
        s === 27 && i._click(i.config.cancelVal)
    }), o = t._artDialog_path || function(e, t, n) {
        for (t in e) e[t].src && e[t].src.indexOf("artDialog") !== -1 && (n = e[t]);
        return i = n || e[e.length - 1], n = i.src.replace(/\\/g, "/"), n.lastIndexOf("/") < 0 ? "." : n.substring(0, n.lastIndexOf("/"))
    }(document.getElementsByTagName("script")), s = i.src.split("skin=")[1];
    if (s) {
        var g = document.createElement("link");
        g.rel = "stylesheet", g.href = o + "/skins/" + s + ".css?" + m.fn.version, i.parentNode.insertBefore(g, i)
    }
    a.bind("load", function() {
        setTimeout(function() {
            if (u) return;
            m({
                left: "-9999em",
                time: 9,
                fixed: !1,
                lock: !1,
                focus: !1
            })
        }, 150)
    });
    try {
        document.execCommand("BackgroundImageCache", !1, !0)
    } catch (y) {}
    m.templates = '<div class="aui_outer"><table class="aui_border"><tbody><tr><td class="aui_nw"></td><td class="aui_n"></td><td class="aui_ne"></td></tr><tr><td class="aui_w"></td><td class="aui_c"><div class="aui_inner"><table class="aui_dialog"><tbody><tr><td colspan="2" class="aui_header"><div class="aui_titleBar"><div class="aui_title"></div><a class="aui_close" href="javascript:/*artDialog*/;">\u00d7</a></div></td></tr><tr><td class="aui_icon"><div class="aui_iconBg"></div></td><td class="aui_main"><div class="aui_content"></div></td></tr><tr><td colspan="2" class="aui_footer"><div class="aui_buttons"></div></td></tr></tbody></table></div></td><td class="aui_e"></td></tr><tr><td class="aui_sw"></td><td class="aui_s"></td><td class="aui_se"></td></tr></tbody></table></div>', m.defaults = {
        content: '<div class="aui_loading"><span>loading..</span></div>',
        title: "\u6d88\u606f",
        button: null,
        ok: null,
        cancel: null,
        init: null,
        close: null,
        okVal: "\u786e\u5b9a",
        cancelVal: "\u53d6\u6d88",
        width: "auto",
        height: "auto",
        minWidth: 96,
        minHeight: 32,
        padding: "20px 25px",
        skin: "",
        icon: null,
        time: null,
        esc: !0,
        focus: !0,
        show: !0,
        follow: null,
        path: o,
        lock: !1,
        background: "#000",
        opacity: .5,
        duration: 300,
        fixed: !1,
        left: "50%",
        top: "38.2%",
        zIndex: 1987,
        resize: !0,
        drag: !0
    }, t.artDialog = e.dialog = e.artDialog = m
})(window.jQuery && (window.art = jQuery) || window.art, this),
function(e) {
    var t, n, r = e(window),
        i = e(document),
        s = document.documentElement,
        o = !-[1] && !("minWidth" in s.style),
        u = "onlosecapture" in s,
        a = "setCapture" in s;
    artDialog.dragEvent = function() {
        var e = this,
            t = function(t) {
                var n = e[t];
                e[t] = function() {
                    return n.apply(e, arguments)
                }
            };
        t("start"), t("move"), t("end")
    }, artDialog.dragEvent.prototype = {
        onstart: e.noop,
        start: function(e) {
            return i.bind("mousemove", this.move).bind("mouseup", this.end), this._sClientX = e.clientX, this._sClientY = e.clientY, this.onstart(e.clientX, e.clientY), !1
        },
        onmove: e.noop,
        move: function(e) {
            return this._mClientX = e.clientX, this._mClientY = e.clientY, this.onmove(e.clientX - this._sClientX, e.clientY - this._sClientY), !1
        },
        onend: e.noop,
        end: function(e) {
            return i.unbind("mousemove", this.move).unbind("mouseup", this.end), this.onend(e.clientX, e.clientY), !1
        }
    }, n = function(e) {
        var n, s, f, l, c, h, p = artDialog.focus,
            d = p.config,
            v = p.DOM,
            m = v.wrap,
            g = v.title,
            y = v.main,
            b = "getSelection" in window ? function() {
                window.getSelection().removeAllRanges()
            } : function() {
                try {
                    document.selection.empty()
                } catch (e) {}
            };
        t.onstart = function(e, n) {
            h ? (s = y[0].offsetWidth, f = y[0].offsetHeight) : (l = m[0].offsetLeft, c = m[0].offsetTop), i.bind("dblclick", t.end), !o && u ? g.bind("losecapture", t.end) : r.bind("blur", t.end), a && g[0].setCapture(), m.addClass("aui_state_drag"), p.focus()
        }, t.onmove = function(e, t) {
            if (h) {
                var r = m[0].style,
                    i = y[0].style,
                    o = e + s,
                    u = t + f;
                r.width = "auto", i.width = Math.max(0, o) + "px", r.width = m[0].offsetWidth + "px", i.height = Math.max(0, u) + "px"
            } else {
                var i = m[0].style,
                    a = e + l,
                    v = t + c;
                d.left = Math.max(n.minX, Math.min(n.maxX, a)), d.top = Math.max(n.minY, Math.min(n.maxY, v)), i.left = d.left + "px", i.top = d.top + "px"
            }
            b(), p._ie6SelectFix()
        }, t.onend = function(e, n) {
            i.unbind("dblclick", t.end), !o && u ? g.unbind("losecapture", t.end) : r.unbind("blur", t.end), a && g[0].releaseCapture(), o && p._autoPositionType(), m.removeClass("aui_state_drag")
        }, h = e.target === v.se[0] ? !0 : !1, n = function() {
            var e, t, n = p.DOM.wrap[0],
                s = n.style.position === "fixed",
                o = n.offsetWidth,
                u = n.offsetHeight,
                a = r.width(),
                f = r.height(),
                l = s ? 0 : i.scrollLeft(),
                c = s ? 0 : i.scrollTop(),
                e = a - o + l;
            return t = f - u + c, {
                minX: l,
                minY: c,
                maxX: e,
                maxY: t
            }
        }(), t.start(e)
    }, i.bind("mousedown", function(e) {
        var r = artDialog.focus;
        if (!r) return;
        var i = e.target,
            s = r.config,
            o = r.DOM;
        if (s.drag !== !1 && i === o.title[0] || s.resize !== !1 && i === o.se[0]) return t = t || new artDialog.dragEvent, n(e), !1
    }), artDialog.fn.shake = function() {
        var e = this.DOM.wrap[0].style,
            t = [4, 8, 4, 0, -4, -8, -4, 0],
            n = function() {
                e.marginLeft = t.shift() + "px", t.length <= 0 && (e.marginLeft = 0, clearInterval(timerId))
            };
        return t = t.concat(t.concat(t)), timerId = setInterval(n, 13), this
    }, artDialog.alert = function(e) {
        return artDialog({
            id: "Alert",
            icon: "warning",
            fixed: !0,
            lock: !0,
            content: e,
            ok: !0
        })
    }, artDialog.success = function(e) {
        return artDialog({
            id: "Success",
            icon: "ok",
            fixed: !0,
            lock: !0,
            content: e,
            ok: !0
        })
    }, artDialog.error = function(e) {
        return artDialog({
            id: "Error",
            icon: "error",
            fixed: !0,
            lock: !0,
            content: e,
            ok: !0
        })
    }, artDialog.confirm = function(e, t, n) {
        return artDialog({
            id: "Confirm",
            icon: "question",
            fixed: !0,
            lock: !0,
            opacity: .1,
            content: e,
            ok: function(e) {
                return t.call(this, e)
            },
            cancel: function(e) {
                return n && n.call(this, e)
            }
        })
    }, artDialog.prompt = function(e, t, n) {
        n = n || "";
        var r;
        return artDialog({
            id: "Prompt",
            icon: "question",
            fixed: !0,
            lock: !0,
            opacity: .1,
            content: ['<div style="margin-bottom:5px;font-size:12px">', e, "</div>", "<div>", '<input value="', n, '" style="width:18em;padding:6px 4px" />', "</div>"].join(""),
            init: function() {
                r = this.DOM.content.find("input")[0], r.select(), r.focus()
            },
            ok: function(e) {
                return t && t.call(this, r.value, e)
            },
            cancel: !0
        })
    }, artDialog.tips = function(e, t) {
        return artDialog({
            id: "Tips",
            title: !1,
            cancel: !1,
            fixed: !0,
            lock: !1
        }).content('<div style="padding: 0 1em;">' + e + "</div>").time(t || 1.5)
    }, artDialog.notice = function(t) {
        var n = t || {},
            r, i, s, o, u, a = 800,
            f = {
                id: "Notice",
                left: "100%",
                top: "100%",
                fixed: !0,
                drag: !1,
                resize: !1,
                follow: null,
                lock: !1,
                init: function(e) {
                    r = this, i = r.config, o = r.DOM.wrap, u = parseInt(o[0].style.top), s = u + o[0].offsetHeight, o.css("top", s + "px").animate({
                        top: u + "px"
                    }, a, function() {
                        n.init && n.init.call(r, e)
                    })
                },
                close: function(t) {
                    return o.animate({
                        top: s + "px"
                    }, a, function() {
                        n.close && n.close.call(this, t), i.close = e.noop, r.close()
                    }), !1
                }
            };
        for (var l in n) f[l] === undefined && (f[l] = n[l]);
        return artDialog(f)
    }
}(window.jQuery || window.art)