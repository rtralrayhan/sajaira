/* Sajaira — front-end behaviours */
(function () {
  const $ = (s, c = document) => c.querySelector(s);
  const $$ = (s, c = document) => [...c.querySelectorAll(s)];

  /* Preloader */
  const pre = $('.preloader');
  if (pre) {
    const done = () => { pre.classList.add('done'); document.body.classList.remove('locked'); };
    document.body.classList.add('locked');
    window.addEventListener('load', () => setTimeout(done, 500));
    setTimeout(done, 2000); // safety
  }

  /* Announcement bar */
  const ann = $('.announce');
  if (ann) {
    try { if (sessionStorage.getItem('ann-hidden')) ann.classList.add('hidden'); } catch (e) {}
    $('.close', ann)?.addEventListener('click', () => {
      ann.classList.add('hidden');
      try { sessionStorage.setItem('ann-hidden', '1'); } catch (e) {}
    });
  }

  /* Header shadow + back to top */
  const header = $('.site-header');
  const toTop = $('.to-top');
  const onScroll = () => {
    const y = window.scrollY;
    header?.classList.toggle('scrolled', y > 40);
    toTop?.classList.toggle('show', y > 900);
  };
  window.addEventListener('scroll', onScroll, { passive: true });
  onScroll();
  toTop?.addEventListener('click', () => window.scrollTo({ top: 0, behavior: 'smooth' }));

  /* Mobile drawer */
  const drawer = $('.drawer');
  const openDrawer = (o) => { drawer.classList.toggle('open', o); document.body.classList.toggle('locked', o); };
  $('.burger')?.addEventListener('click', () => openDrawer(true));
  $$('.drawer .scrim, .drawer .close-x').forEach(el => el.addEventListener('click', () => openDrawer(false)));

  /* Scroll reveal */
  const io = new IntersectionObserver((entries) => {
    entries.forEach(e => { if (e.isIntersecting) { e.target.classList.add('in'); io.unobserve(e.target); } });
  }, { threshold: 0.12, rootMargin: '0px 0px -6% 0px' });
  $$('.reveal').forEach(el => io.observe(el));

  /* Hero slider */
  const hero = $('.hero');
  if (hero) {
    const slides = $$('.slide', hero);
    const dots = $('.hero-dots', hero);
    const count = $('.hero-count', hero);
    let i = 0, timer;
    slides.forEach((_, n) => {
      const b = document.createElement('button');
      b.setAttribute('aria-label', `Slide ${n + 1}`);
      b.addEventListener('click', () => go(n));
      dots.appendChild(b);
    });
    const go = (n) => {
      i = (n + slides.length) % slides.length;
      slides.forEach((s, k) => s.classList.toggle('active', k === i));
      $$('button', dots).forEach((d, k) => d.classList.toggle('active', k === i));
      if (count) count.textContent = `${String(i + 1).padStart(2, '0')} / ${String(slides.length).padStart(2, '0')}`;
      restart();
    };
    const restart = () => { clearInterval(timer); timer = setInterval(() => go(i + 1), 6500); };
    $('.hero-prev', hero)?.addEventListener('click', () => go(i - 1));
    $('.hero-next', hero)?.addEventListener('click', () => go(i + 1));
    go(0);
  }

  /* Featured split slider */
  const feat = $('.feature');
  if (feat) {
    const items = $$('[data-f]', feat);
    const imgs = $$('.feature-media img', feat);
    const dots = $('.feature-panel .dots', feat);
    const n = imgs.length;
    let i = 0, timer;
    for (let k = 0; k < n; k++) {
      const b = document.createElement('button');
      b.addEventListener('click', () => go(k));
      dots.appendChild(b);
    }
    const go = (k) => {
      i = (k + n) % n;
      items.forEach(el => { const on = +el.dataset.f === i; el.classList.toggle('active', on); if (on) { el.classList.remove('fade'); void el.offsetWidth; el.classList.add('fade'); } });
      imgs.forEach((im, k2) => im.classList.toggle('active', k2 === i));
      $$('button', dots).forEach((d, k2) => d.classList.toggle('active', k2 === i));
      clearInterval(timer); timer = setInterval(() => go(i + 1), 5500);
    };
    go(0);
  }

  /* Carousels */
  $$('.carousel-wrap').forEach(wrap => {
    const track = $('.carousel', wrap);
    const step = () => track.clientWidth * 0.8;
    $('.c-prev', wrap)?.addEventListener('click', () => track.scrollBy({ left: -step(), behavior: 'smooth' }));
    $('.c-next', wrap)?.addEventListener('click', () => track.scrollBy({ left: step(), behavior: 'smooth' }));
  });

  /* Occasions hover */
  const occ = $('.occasions');
  if (occ) {
    const lis = $$('.occ-list li', occ);
    const left = $('.occ-img.left', occ), right = $('.occ-img.right', occ);
    const setImg = (fig, src) => {
      if (!fig) return;
      const cur = $('img.active', fig);
      if (cur && cur.dataset.src === src) return;
      let next = $$('img', fig).find(im => im.dataset.src === src);
      if (!next) { next = document.createElement('img'); next.dataset.src = src; next.src = src; next.alt = ''; fig.appendChild(next); }
      $$('img', fig).forEach(im => im.classList.toggle('active', im === next));
    };
    const activate = (li) => {
      lis.forEach(l => l.classList.toggle('active', l === li));
      setImg(left, li.dataset.left); setImg(right, li.dataset.right);
    };
    lis.forEach(li => li.addEventListener('mouseenter', () => activate(li)));
    lis.forEach(li => li.addEventListener('focusin', () => activate(li)));
    activate(lis[0]);
  }

  /* Background video: play only while in view */
  $$('.video-hero video').forEach(v => {
    new IntersectionObserver((es) => es.forEach(e => { if (e.isIntersecting) v.play().catch(() => {}); else v.pause(); }), { threshold: 0.2 }).observe(v);
  });

  /* Video modal */
  const modal = $('.modal');
  if (modal) {
    const v = $('video', modal);
    const open = (src, portrait) => {
      if (src && v.getAttribute('src') !== src) { v.setAttribute('src', src); v.load(); }
      modal.classList.toggle('portrait', !!portrait);
      modal.classList.add('open'); document.body.classList.add('locked'); v.currentTime = 0; v.muted = false; v.play().catch(() => {});
    };
    const close = () => { modal.classList.remove('open'); document.body.classList.remove('locked'); v.pause(); };
    $$('[data-play]').forEach(b => b.addEventListener('click', () => open(b.dataset.play, b.dataset.portrait !== undefined)));
    $('.close-x', modal).addEventListener('click', close);
    modal.addEventListener('click', (e) => { if (e.target === modal) close(); });
    document.addEventListener('keydown', (e) => { if (e.key === 'Escape') { close(); openDrawer && drawer && openDrawer(false); } });
  }

  /* Reels: play muted while in view, click opens modal with sound */
  $$('.reel').forEach(r => {
    const v = $('video', r);
    if (!v) return;
    new IntersectionObserver((es) => es.forEach(e => {
      if (e.isIntersecting) { v.play().then(() => r.classList.add('playing')).catch(() => {}); } else { v.pause(); r.classList.remove('playing'); }
    }), { threshold: 0.4 }).observe(r);
  });

  /* Collection filter chips */
  $$('.chips').forEach(ch => {
    const grid = $(ch.dataset.target);
    $$('button', ch).forEach(b => b.addEventListener('click', () => {
      $$('button', ch).forEach(x => x.classList.toggle('active', x === b));
      const f = b.dataset.filter;
      $$('.product', grid).forEach(p => p.classList.toggle('hide', f !== 'all' && !(p.dataset.cat || '').split(' ').includes(f)));
    }));
  });

  /* Journal tabs */
  const journal = $('.journal');
  if (journal) {
    const tabs = $$('.tabs button', journal);
    const rows = $$('.journal-row', journal);
    tabs.forEach(t => t.addEventListener('click', () => {
      tabs.forEach(x => x.classList.toggle('active', x === t));
      const f = t.dataset.filter;
      rows.forEach(r => r.classList.toggle('hide', f !== 'all' && r.dataset.cat !== f));
    }));
  }

  /* Newsletter (demo) */
  $$('form.newsletter').forEach(f => f.addEventListener('submit', (e) => {
    e.preventDefault();
    const btn = $('button', f); btn.textContent = 'Thank you'; btn.disabled = true;
  }));
})();
