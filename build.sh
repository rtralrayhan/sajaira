#!/bin/zsh
# Generates index.html and about.html from shared partials. Run: ./build.sh
set -e
V=$(date +%s)
ICO_ARROW='<svg viewBox="0 0 16 16" fill="none" stroke="currentColor" stroke-width="1.5"><path d="M2 8h11M9 4l4 4-4 4"/></svg>'
ICO_LEFT='<svg viewBox="0 0 16 16" fill="none" stroke="currentColor" stroke-width="1.5"><path d="M10 3L5 8l5 5"/></svg>'
ICO_RIGHT='<svg viewBox="0 0 16 16" fill="none" stroke="currentColor" stroke-width="1.5"><path d="M6 3l5 5-5 5"/></svg>'
ICO_UP='<svg viewBox="0 0 16 16" fill="none" stroke="currentColor" stroke-width="1.5"><path d="M8 14V2M4 6l4-4 4 4"/></svg>'
ICO_X='<svg viewBox="0 0 20 20" fill="none" stroke="currentColor" stroke-width="1.5"><path d="M4 4l12 12M16 4L4 16"/></svg>'
ICO_IG='<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.7"><rect x="3" y="3" width="18" height="18" rx="5"/><circle cx="12" cy="12" r="4"/><circle cx="17.5" cy="6.5" r="1" fill="currentColor" stroke="none"/></svg>'
ICO_TT='<svg viewBox="0 0 24 24" fill="currentColor"><path d="M16.5 3c.4 2.4 1.9 4 4.5 4.3v3.2c-1.7 0-3.2-.5-4.5-1.4v6.4A6.1 6.1 0 1 1 10.4 9.4v3.3a2.9 2.9 0 1 0 2.9 2.9V3h3.2z"/></svg>'
ICO_FB='<svg viewBox="0 0 24 24" fill="currentColor"><path d="M13.5 21v-7h2.4l.4-3h-2.8V9.2c0-.9.3-1.5 1.5-1.5h1.5V5.1c-.3 0-1.2-.1-2.2-.1-2.2 0-3.7 1.3-3.7 3.8V11H8v3h2.6v7h2.9z"/></svg>'
ICO_SEARCH='<svg class="icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.6"><circle cx="11" cy="11" r="7"/><path d="M20 20l-4-4"/></svg>'
ICO_HEART='<svg class="icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.6"><path d="M12 20s-7-4.4-7-10a4 4 0 0 1 7-2.6A4 4 0 0 1 19 10c0 5.6-7 10-7 10z"/></svg>'
ICO_BAG='<svg class="icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.6"><path d="M5 8h14l-1 12H6L5 8z"/><path d="M9 8V6a3 3 0 0 1 6 0v2"/></svg>'
ICO_PLAY='<svg viewBox="0 0 10 10"><path d="M1 0l8 5-8 5z"/></svg>'
WISH='<button class="wish" aria-label="Add to wishlist"><svg viewBox="0 0 24 24"><path d="M12 20s-7-4.4-7-10a4 4 0 0 1 7-2.6A4 4 0 0 1 19 10c0 5.6-7 10-7 10z"/></svg></button>'

head() { cat <<EOF
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>$1</title>
<meta name="description" content="$2">
<link rel="icon" href="images/jewelry/profile.jpg">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Instrument+Serif:ital@0;1&family=Figtree:wght@400;500;600&display=swap" rel="stylesheet">
<link rel="stylesheet" href="css/style.css?v=$V">
</head>
<body>
<div class="preloader" aria-hidden="true"><div class="word"><span>Sajaira</span></div><div class="bar"></div></div>
EOF
}

header() { # $1 active: home|about
cat <<EOF
<header class="site-header">
  <div class="announce"><span class="msg"><strong>Free shipping</strong> across the US over \$100<span class="msg-l"> &nbsp;·&nbsp; DM on Instagram to order</span></span><button class="close" aria-label="Dismiss">$ICO_X</button></div>
  <div class="nav-card">
    <button class="burger" aria-label="Open menu"><span></span><span></span><span></span></button>
    <nav class="nav-links">
      <a href="index.html#jewelry">Jewelry</a>
      <a href="index.html#clothing">Clothing</a>
      <a href="index.html#journal">Journal</a>
    </nav>
    <a class="brand" href="index.html">Sajaira</a>
    <div class="nav-utils">
      <a class="text$( [ "$1" = about ] && echo ' active')" href="about.html">About</a>
      <a class="icon-btn hide-m" href="#" aria-label="Search">$ICO_SEARCH</a>
      <a class="icon-btn hide-m" href="#" aria-label="Wishlist">$ICO_HEART</a>
      <a class="icon-btn" href="#" aria-label="Bag">$ICO_BAG<span class="text">Bag (0)</span></a>
    </div>
  </div>
</header>
<div class="drawer" aria-hidden="true">
  <div class="scrim"></div>
  <div class="panel">
    <a class="brand" href="index.html">Sajaira</a>
    <button class="close-x" aria-label="Close menu">$ICO_X</button>
    <nav>
      <a href="index.html#jewelry">Jewelry</a>
      <a href="index.html#clothing">Clothing</a>
      <a href="index.html#occasions">Occasions</a>
      <a href="index.html#journal">Journal</a>
      <a href="about.html">About</a>
    </nav>
    <div class="small">
      <a href="https://www.instagram.com/sajaira.jewelry/" target="_blank" rel="noopener">@sajaira.jewelry</a>
      <a href="https://www.instagram.com/sajaira.clothing/" target="_blank" rel="noopener">@sajaira.clothing</a>
      <a href="#">Search</a>
      <a href="#">Wishlist</a>
    </div>
  </div>
</div>
EOF
}

connect() { cat <<EOF
<section class="connect">
  <img src="images/stock/henna-hands.jpg" alt="">
  <div class="inner">
    <p class="eyebrow light reveal">Newsletter</p>
    <h2 class="reveal" data-delay="1">Stay Connected</h2>
    <p class="reveal" data-delay="2">Sign up to be the first to hear about new drops, live sales and exclusive offers. It's your inside track to the festive edit.</p>
    <form class="newsletter reveal" data-delay="3"><input type="email" placeholder="Enter your email..." required><button type="submit">Sign-up</button></form>
    <p class="note">By subscribing you agree to Sajaira's Privacy Policy and Terms of Service.</p>
  </div>
</section>
EOF
}

footer() { cat <<EOF
<footer class="site-footer">
  <div class="footer-card">
    <div class="footer-grid">
      <div class="footer-brand">
        <a class="brand" href="index.html">Sajaira</a>
        <p>Deshi jewelry and designer clothing, handpicked in New York and shipped across the United States. Light up your world.</p>
        <div class="socials">
          <a href="https://www.instagram.com/sajaira.jewelry/" target="_blank" rel="noopener" aria-label="Instagram">$ICO_IG</a>
          <a href="#" aria-label="TikTok">$ICO_TT</a>
          <a href="#" aria-label="Facebook">$ICO_FB</a>
        </div>
      </div>
      <div><h4>Shop</h4><ul><li><a href="index.html#jewelry">Jewelry</a></li><li><a href="index.html#clothing">Clothing</a></li><li><a href="index.html#occasions">Occasions</a></li><li><a href="index.html#arrivals">New Arrivals</a></li><li><a href="#">Gift Cards</a></li></ul></div>
      <div><h4>Help</h4><ul><li><a href="#">Contact</a></li><li><a href="#">Delivery</a></li><li><a href="#">Returns</a></li><li><a href="#">Size Guide</a></li><li><a href="#">FAQs</a></li></ul></div>
      <div><h4>About</h4><ul><li><a href="about.html">Our Story</a></li><li><a href="index.html#journal">Journal</a></li><li><a href="#">Live Sales</a></li><li><a href="#">Wholesale</a></li><li><a href="#">Careers</a></li></ul></div>
      <div><h4>Follow</h4><ul><li><a href="https://www.instagram.com/sajaira.jewelry/" target="_blank" rel="noopener">@sajaira.jewelry</a></li><li><a href="https://www.instagram.com/sajaira.clothing/" target="_blank" rel="noopener">@sajaira.clothing</a></li><li><a href="#">TikTok</a></li><li><a href="#">Facebook</a></li></ul></div>
    </div>
    <div class="footer-bottom">
      <div class="legal">
        <span>&copy; 2026 Sajaira &middot; New York</span>
        <a href="#">Terms &amp; Conditions</a><a href="#">Privacy Policy</a><a href="#">Cookies</a>
      </div>
      <div class="pay"><span>VISA</span><span>MC</span><span>AMEX</span><span>APPLE PAY</span><span>PAYPAL</span><span>KLARNA</span></div>
    </div>
  </div>
</footer>
<button class="to-top">Back to top $ICO_UP</button>
<script src="js/main.js?v=$V"></script>
</body>
</html>
EOF
}

product() { # name price img alt swatches tag
cat <<EOF
      <article class="product reveal">
        <a class="product-media" href="#">
          <img class="main" src="$3" alt="$1" loading="lazy"><img class="alt" src="$4" alt="" loading="lazy">
          $( [ -n "$6" ] && echo "<span class=\"pill dark tag\">$6</span>" )
          $WISH
          <span class="quick">Quick view</span>
        </a>
        <h3>$1</h3>
        <p class="price">$2</p>
        <div class="swatches">$5</div>
      </article>
EOF
}

# ---------------------------------------------------------------- INDEX
{
head "Sajaira — Deshi Jewelry &amp; Designer Clothing, New York" "Handpicked Deshi jewelry and designer sarees, kurtas and chikankari sets. Free US shipping over \$100."
header home
cat <<EOF
<main>
<!-- Hero slider -->
<section class="hero" aria-label="Featured">
  <div class="slide"><img src="images/stock/hero-jewelry.jpg" alt="">
    <div class="slide-content"><p class="eyebrow light">The Festive Edit 2026</p><h1>Light Up Your World</h1><p class="sub">Handpicked Deshi jewelry and designer clothing, curated in New York and shipped across the United States.</p><a class="link-u" href="#jewelry">Shop the Edit</a></div></div>
  <div class="slide"><img src="images/stock/hero-gold.jpg" alt="">
    <div class="slide-content"><p class="eyebrow light">Jewelry</p><h1>Gold for Every Occasion</h1><p class="sub">Chandelier earrings, glass bangles and cocktail rings — the sparkle of home, delivered to your door.</p><a class="link-u" href="#jewelry">Shop Jewelry</a></div></div>
  <div class="slide"><img src="images/stock/hero-bride.jpg" alt="">
    <div class="slide-content"><p class="eyebrow light">Clothing</p><h1>The Chikankari Collection</h1><p class="sub">Hand-embroidered kurtas, designer sarees and festive sets in the season's colours.</p><a class="link-u" href="#clothing">Shop Clothing</a></div></div>
  <div class="hero-ui">
    <span class="hero-count">01 / 03</span>
    <div class="hero-dots"></div>
    <div class="hero-arrows"><button class="arrow-btn hero-prev" aria-label="Previous">$ICO_LEFT</button><button class="arrow-btn hero-next" aria-label="Next">$ICO_RIGHT</button></div>
  </div>
  <div class="scroll-hint"></div>
</section>

<!-- Category tiles -->
<section class="block tight" id="jewelry">
  <div class="section-head reveal">
    <div><p class="eyebrow">Discover</p><h2 class="title-lg">Shop by Category</h2></div>
    <a class="link-arrow" href="#arrivals">Shop All $ICO_ARROW</a>
  </div>
  <div class="cats">
    <a class="cat reveal" href="#arrivals"><img src="images/jewelry/01.jpg" alt=""><span>Earrings</span></a>
    <a class="cat reveal" data-delay="1" href="#arrivals"><img src="images/jewelry/03.jpg" alt=""><span>Bangles</span></a>
    <a class="cat reveal" data-delay="2" href="#arrivals"><img src="images/jewelry/06.jpg" alt=""><span>Rings</span></a>
    <a class="cat reveal" data-delay="3" href="#clothing"><img src="images/clothing/01.jpg" alt=""><span>Sarees</span></a>
    <a class="cat reveal" data-delay="1" href="#clothing"><img src="images/clothing/11.jpg" alt=""><span>Kurtas</span></a>
    <a class="cat reveal" data-delay="2" href="#clothing"><img src="images/clothing/12.jpg" alt=""><span>Festive Sets</span></a>
  </div>
</section>

<!-- Featured split -->
<section class="block tight">
  <div class="feature reveal">
    <div class="feature-panel">
      <div class="top">
        <p class="eyebrow">Festive Edit 2026</p>
        <h2>Where tradition meets the everyday.</h2>
        <p class="desc">Our new season brings hand-embroidered chikankari, statement gold and glass bangles in every colour — made to be worn from the mehendi to the morning after.</p>
      </div>
      <div class="bottom">
        <div data-f="0"><p class="product-line"><span>Noor Chandelier Earrings</span><span>\$48</span></p><a class="link-u" href="#">View Product</a></div>
        <div data-f="1"><p class="product-line"><span>Lavender Chikankari Set</span><span>\$120</span></p><a class="link-u" href="#">View Product</a></div>
        <div data-f="2"><p class="product-line"><span>Sky Glass Bangles</span><span>\$32</span></p><a class="link-u" href="#">View Product</a></div>
        <div class="dots"></div>
      </div>
    </div>
    <div class="feature-media">
      <img src="images/stock/portrait-jewelry.jpg" alt="">
      <img src="images/stock/saree-purple.jpg" alt="">
      <img src="images/stock/henna-hands.jpg" alt="">
    </div>
  </div>
</section>

<!-- New arrivals carousel -->
<section class="block" id="arrivals">
  <div class="carousel-wrap">
    <div class="section-head reveal">
      <div><p class="eyebrow">Just landed</p><h2 class="title-lg">New Arrivals</h2></div>
      <div class="arrows"><button class="arrow-btn c-prev" aria-label="Previous">$ICO_LEFT</button><button class="arrow-btn c-next" aria-label="Next">$ICO_RIGHT</button></div>
    </div>
    <div class="carousel">
$(product "Noor Chandelier Earrings" "\$48" images/jewelry/01.jpg images/stock/portrait-jewelry.jpg '<i style="--c:#4fb3c9"></i><i style="--c:#b8923a"></i><span>+2 colours</span>' New)
$(product "Sky Glass Bangles" "\$32" images/jewelry/03.jpg images/jewelry/10.jpg '<i style="--c:#9cd3e6"></i><i style="--c:#c9b26b"></i><i style="--c:#d8d8d8"></i>' New)
$(product "Gulab Stone Drops" "\$42" images/jewelry/02.jpg images/jewelry/01.jpg '<i style="--c:#a4232b"></i><i style="--c:#2c6b3f"></i><span>+1 colour</span>')
$(product "Meera Cocktail Ring" "\$28" images/jewelry/04.jpg images/jewelry/06.jpg '<i style="--c:#e8e8e8"></i>' New)
$(product "Lavender Chikankari Set" "\$120" images/clothing/11.jpg images/stock/saree-purple.jpg '<i style="--c:#b39ddb"></i><i style="--c:#f1a7c4"></i><i style="--c:#8fbc8f"></i>' New)
$(product "Olive Chikankari Kurta" "\$95" images/clothing/02.jpg images/clothing/06.jpg '<i style="--c:#8fa35a"></i><i style="--c:#e88fb0"></i><i style="--c:#6b1f2a"></i>')
$(product "Zari Stacked Bangles" "\$36" images/jewelry/10.jpg images/jewelry/12.jpg '<i style="--c:#c9b26b"></i><i style="--c:#b8923a"></i>')
$(product "Festive Embroidered Sets" "\$140" images/clothing/12.jpg images/clothing/03.jpg '<i style="--c:#1c1b1a"></i><i style="--c:#0f6b5c"></i><i style="--c:#b7472a"></i>' New)
    </div>
  </div>
</section>

<!-- Occasions -->
<section class="occasions" id="occasions">
  <p class="eyebrow reveal">Shop by occasion</p>
  <div class="occ-stage reveal">
    <figure class="occ-img left"></figure>
    <ul class="occ-list">
      <li data-left="images/stock/bridal-portrait.jpg" data-right="images/stock/jewelry-set.jpg"><a href="#arrivals">Wedding</a></li>
      <li data-left="images/stock/saree-golden.jpg" data-right="images/jewelry/10.jpg"><a href="#arrivals">Eid</a></li>
      <li data-left="images/stock/henna-hands.jpg" data-right="images/clothing/02.jpg"><a href="#arrivals">Mehendi</a></li>
      <li data-left="images/stock/saree-orange.jpg" data-right="images/clothing/06.jpg"><a href="#arrivals">Festive</a></li>
      <li data-left="images/stock/saree-black-gold.jpg" data-right="images/jewelry/12.jpg"><a href="#arrivals">Everyday</a></li>
    </ul>
    <figure class="occ-img right"></figure>
  </div>
  <a class="link-arrow reveal" href="#arrivals">Shop by occasion $ICO_ARROW</a>
</section>

<!-- Video -->
<section class="video-hero" id="clothing">
  <video autoplay muted loop playsinline poster="images/stock/saree-red.jpg"><source src="video/7184324.mp4" type="video/mp4"></video>
  <div class="overlay">
    <p class="eyebrow light reveal">Clothing</p>
    <h2 class="reveal" data-delay="1">The Saree Edit</h2>
    <p class="lede reveal" data-delay="2">Explore our new season.</p>
    <a class="btn btn-light reveal" data-delay="3" href="#arrivals">Explore Now</a>
    <button class="play reveal" data-delay="3" data-play><i>$ICO_PLAY</i>Play video</button>
  </div>
</section>

<!-- Campaign -->
<section class="block">
  <div class="campaign-media reveal">
    <figure><img src="images/stock/bride-wide.jpg" alt="" loading="lazy"></figure>
    <figure><img src="images/stock/portrait-traditional.jpg" alt="" loading="lazy"></figure>
  </div>
  <div class="campaign-text reveal">
    <div>
      <span class="pill">Campaign</span>
      <h2>A Season of Light</h2>
      <p>Our Festive Edit 2026 unfolds as A Season of Light — where the wedding tent softens into a living room, and every evening becomes a reason to dress up. Photographed in New York with the pieces we love most.</p>
    </div>
    <a class="link-u" href="#arrivals">Discover the Collection</a>
  </div>
</section>

<!-- Journal -->
<section class="block tight" id="journal">
  <div class="journal reveal">
    <div class="journal-head">
      <h2>Journal</h2>
      <div class="tabs"><button class="active" data-filter="all">Read All</button><button data-filter="campaign">Campaigns</button><button data-filter="lookbook">Lookbooks</button><button data-filter="story">Stories</button></div>
    </div>
    <div class="journal-row" data-cat="campaign">
      <article><span class="pill">Campaign</span><h3>A Season of Light</h3><p>Festive Edit 2026 unfolds as A Season of Light, where every evening becomes a reason to dress up and the pieces do the talking.</p><a class="link-u" href="#">Read More</a></article>
      <article><span class="pill">Lookbook</span><h3>The Chikankari Edit</h3><p>Hand-embroidered in Lucknow, styled in the Bronx. Six ways to wear this season's kurta sets from brunch to baraat.</p><a class="link-u" href="#">Read More</a></article>
      <figure><img src="images/stock/saree-two.jpg" alt="" loading="lazy"></figure>
    </div>
    <div class="journal-row" data-cat="lookbook">
      <article><span class="pill">Lookbook</span><h3>Bangles, Stacked</h3><p>Glass, zari and metal — how we layer bangles for weight, colour and the perfect chime.</p><a class="link-u" href="#">Read More</a></article>
      <article><span class="pill">Story</span><h3>Why We Photograph Everything Ourselves</h3><p>What you see on our page is exactly what arrives at your door. A short note on honest photography.</p><a class="link-u" href="#">Read More</a></article>
      <figure><img src="images/jewelry/03.jpg" alt="" loading="lazy"></figure>
    </div>
    <div class="journal-row" data-cat="story">
      <article><span class="pill">Story</span><h3>Live on Fridays</h3><p>Every Friday at 9pm we go live with fresh stock. Here's how the live sales work and how to reserve a piece.</p><a class="link-u" href="#">Read More</a></article>
      <article><span class="pill">Story</span><h3>From a Single Suitcase</h3><p>How Sajaira went from one suitcase of bangles to two Instagram shops and a studio in New York.</p><a class="link-u" href="about.html">Read More</a></article>
      <figure><img src="images/stock/jewelry-set.jpg" alt="" loading="lazy"></figure>
    </div>
  </div>
</section>

<!-- Marquee -->
<section class="marquee-sec">
  <div class="marquee"><div class="marquee-track"><span>New Drop Every Friday —</span><span>New Drop Every Friday —</span><span>New Drop Every Friday —</span><span>New Drop Every Friday —</span></div></div>
  <figure class="marquee-product"><img src="images/stock/jewelry-set.jpg" alt="Festive jewelry set"></figure>
  <div class="marquee-caption reveal"><a class="link-u" href="https://www.instagram.com/sajaira.jewelry/" target="_blank" rel="noopener">Join the live sale</a></div>
</section>

<!-- Story -->
<section class="block">
  <div class="story">
    <div class="reveal">
      <h2>A Little Piece of Home</h2>
      <p>We started as a way to bring the jewelry and clothing we grew up loving to the Deshi community across the United States. One suitcase, a kitchen-table photo studio and a lot of DMs later, Sajaira is two Instagram shops and a small studio in New York.</p>
      <p>Every piece is handpicked, photographed by us and shipped from New York — free across the US on orders over \$100.</p>
      <a class="link-arrow" href="about.html">Find out more $ICO_ARROW</a>
    </div>
    <figure class="reveal" data-delay="1"><img src="images/stock/saree-two.jpg" alt="" loading="lazy"></figure>
  </div>
</section>

<!-- Instagram -->
<section class="block tight">
  <div class="ig-head reveal">
    <h2>@sajaira.jewelry &nbsp;/&nbsp; @sajaira.clothing</h2>
    <a class="link-arrow" href="https://www.instagram.com/sajaira.jewelry/" target="_blank" rel="noopener">Follow us on Instagram $ICO_ARROW</a>
  </div>
  <div class="ig-grid">
    <a class="reveal" href="https://www.instagram.com/sajaira.jewelry/" target="_blank" rel="noopener"><img src="images/jewelry/01.jpg" alt="" loading="lazy">$ICO_IG</a>
    <a class="reveal" data-delay="1" href="https://www.instagram.com/sajaira.clothing/" target="_blank" rel="noopener"><img src="images/clothing/11.jpg" alt="" loading="lazy">$ICO_IG</a>
    <a class="reveal" data-delay="2" href="https://www.instagram.com/sajaira.jewelry/" target="_blank" rel="noopener"><img src="images/jewelry/06.jpg" alt="" loading="lazy">$ICO_IG</a>
    <a class="reveal" data-delay="3" href="https://www.instagram.com/sajaira.clothing/" target="_blank" rel="noopener"><img src="images/clothing/07.jpg" alt="" loading="lazy">$ICO_IG</a>
    <a class="reveal" data-delay="1" href="https://www.instagram.com/sajaira.jewelry/" target="_blank" rel="noopener"><img src="images/jewelry/12.jpg" alt="" loading="lazy">$ICO_IG</a>
    <a class="reveal" data-delay="2" href="https://www.instagram.com/sajaira.clothing/" target="_blank" rel="noopener"><img src="images/clothing/06.jpg" alt="" loading="lazy">$ICO_IG</a>
  </div>
</section>

$(connect)
</main>
<div class="modal" aria-hidden="true"><button class="close-x" aria-label="Close">$ICO_X</button><video controls playsinline preload="none" poster="images/stock/saree-red.jpg"><source src="video/10271742.mp4" type="video/mp4"></video></div>
EOF
footer
} > index.html

# ---------------------------------------------------------------- ABOUT
{
head "About — Sajaira" "The story behind Sajaira, a New York based curator of Deshi jewelry and designer clothing."
header about
cat <<EOF
<main>
<section class="page-hero">
  <img src="images/stock/saree-golden.jpg" alt="">
  <div class="inner"><p class="eyebrow light">About Sajaira</p><h1>Our Story</h1><p class="sub">Made for the moments that sparkle.</p></div>
</section>

<section class="block">
  <div class="intro reveal">
    <p class="eyebrow" style="margin-bottom:22px">Who we are</p>
    <p>Sajaira is a small, family-run label bringing Deshi jewelry and clothing to the diaspora across the United States. Lorem ipsum dolor sit amet, consectetur adipiscing elit — every piece is handpicked, photographed by us and shipped from New York.</p>
  </div>
</section>

<section class="block tight" style="padding-top:0">
  <div class="stats reveal">
    <div class="stat"><strong>2019</strong><span>Founded in New York</span></div>
    <div class="stat"><strong>900+</strong><span>Pieces curated</span></div>
    <div class="stat"><strong>3.2k</strong><span>Community members</span></div>
    <div class="stat"><strong>50</strong><span>States shipped to</span></div>
  </div>
</section>

<section class="block">
  <div class="story">
    <div class="reveal">
      <p class="eyebrow" style="margin-bottom:14px">How it began</p>
      <h2>From a Single Suitcase</h2>
      <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
      <p>Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
    </div>
    <figure class="reveal" data-delay="1"><img src="images/stock/saree-two.jpg" alt="" loading="lazy"></figure>
  </div>
</section>

<section class="block" style="padding-top:0">
  <div class="story flip">
    <div class="reveal">
      <p class="eyebrow" style="margin-bottom:14px">How we work</p>
      <h2>Photographed by Us, Always</h2>
      <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.</p>
      <p>Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.</p>
      <a class="link-arrow" href="index.html#journal">Read the journal $ICO_ARROW</a>
    </div>
    <figure class="color reveal" data-delay="1"><img src="images/stock/jewelry-set.jpg" alt="" loading="lazy"></figure>
  </div>
</section>

<section class="block tight" style="padding-top:0">
  <div class="section-head reveal"><div><p class="eyebrow">What we stand for</p><h2 class="title-lg">Three things we never compromise on.</h2></div></div>
  <div class="values">
    <div class="value reveal"><div class="num">01</div><h3>Handpicked pieces</h3><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Every bangle, earring and saree is chosen by us before it is offered to you.</p></div>
    <div class="value reveal" data-delay="1"><div class="num">02</div><h3>Honest photography</h3><p>Nemo enim ipsam voluptatem quia voluptas sit aspernatur. What you see on our page is exactly what arrives at your door.</p></div>
    <div class="value reveal" data-delay="2"><div class="num">03</div><h3>Community first</h3><p>Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet. We are here for the Deshi community, one order and one DM at a time.</p></div>
  </div>
</section>

<section class="quote">
  <blockquote class="reveal">&ldquo;Lorem ipsum dolor sit amet, consectetur adipiscing elit. I wanted every celebration in our community to feel a little closer to home.&rdquo;<cite>— Founder, Sajaira</cite></blockquote>
</section>

<section class="block">
  <div class="section-head reveal"><div><p class="eyebrow">The journey</p><h2 class="title-lg">Milestones</h2></div></div>
  <div class="timeline">
    <div class="reveal"><div class="year">2019</div><h3>The first suitcase</h3><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. One suitcase of bangles and earrings, sold to friends and family.</p></div>
    <div class="reveal" data-delay="1"><div class="year">2021</div><h3>@sajaira.jewelry</h3><p>Ut enim ad minim veniam, quis nostrud exercitation. The Instagram shop opens and the first live sale sells out in an hour.</p></div>
    <div class="reveal" data-delay="2"><div class="year">2023</div><h3>@sajaira.clothing</h3><p>Duis aute irure dolor in reprehenderit. Designer sarees and chikankari sets join the edit under a second shop.</p></div>
    <div class="reveal" data-delay="3"><div class="year">2026</div><h3>Sajaira.com</h3><p>Excepteur sint occaecat cupidatat non proident. A home of our own, with free shipping across all fifty states.</p></div>
  </div>
</section>

<section class="block tight" style="padding-top:0">
  <div class="section-head reveal"><div><p class="eyebrow">The people</p><h2 class="title-lg">Meet the Team</h2></div></div>
  <div class="team">
    <div class="member reveal"><figure><img src="images/stock/saree-blue.jpg" alt="" loading="lazy"></figure><h3>Founder Name</h3><span>Founder &amp; Curator</span></div>
    <div class="member reveal" data-delay="1"><figure><img src="images/stock/saree-orange.jpg" alt="" loading="lazy"></figure><h3>Team Member</h3><span>Clothing &amp; Styling</span></div>
    <div class="member reveal" data-delay="2"><figure><img src="images/stock/saree-red.jpg" alt="" loading="lazy"></figure><h3>Team Member</h3><span>Photography &amp; Live Sales</span></div>
  </div>
</section>

<section class="block tight">
  <div class="contact">
    <div class="contact-panel reveal">
      <p class="eyebrow">Get in touch</p>
      <h2>Questions, custom orders, or just to say hello.</h2>
      <p>The fastest way to reach us is a DM on Instagram — we reply to every message. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
      <dl>
        <dt>Jewelry</dt><dd><a href="https://www.instagram.com/sajaira.jewelry/" target="_blank" rel="noopener">@sajaira.jewelry</a></dd>
        <dt>Clothing</dt><dd><a href="https://www.instagram.com/sajaira.clothing/" target="_blank" rel="noopener">@sajaira.clothing</a></dd>
        <dt>Email</dt><dd><a href="mailto:hello@sajaira.com">hello@sajaira.com</a></dd>
        <dt>Studio</dt><dd>New York, USA — by appointment</dd>
        <dt>Shipping</dt><dd>Free across the US on orders over \$100</dd>
      </dl>
    </div>
    <div class="contact-media reveal" data-delay="1"><img src="images/stock/bride-wide.jpg" alt="" loading="lazy"></div>
  </div>
</section>

$(connect)
</main>
EOF
footer
} > about.html
echo "built: $(wc -c < index.html) bytes index, $(wc -c < about.html) bytes about"
