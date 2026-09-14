#!/bin/zsh
# Generates index.html, jewelry.html, clothing.html, about.html from shared partials. Run: ./build.sh
set -e
V=$(date +%s)
IG_J="https://www.instagram.com/sajaira.jewelry/"
IG_C="https://www.instagram.com/sajaira.clothing/"
TT="https://www.tiktok.com/@sajaira04"
FB="https://www.facebook.com/SajairaJewelry/"
ICO_ARROW='<svg viewBox="0 0 16 16" fill="none" stroke="currentColor" stroke-width="1.5"><path d="M2 8h11M9 4l4 4-4 4"/></svg>'
ICO_LEFT='<svg viewBox="0 0 16 16" fill="none" stroke="currentColor" stroke-width="1.5"><path d="M10 3L5 8l5 5"/></svg>'
ICO_RIGHT='<svg viewBox="0 0 16 16" fill="none" stroke="currentColor" stroke-width="1.5"><path d="M6 3l5 5-5 5"/></svg>'
ICO_UP='<svg viewBox="0 0 16 16" fill="none" stroke="currentColor" stroke-width="1.5"><path d="M8 14V2M4 6l4-4 4 4"/></svg>'
ICO_X='<svg viewBox="0 0 20 20" fill="none" stroke="currentColor" stroke-width="1.5"><path d="M4 4l12 12M16 4L4 16"/></svg>'
ICO_IG='<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.7"><rect x="3" y="3" width="18" height="18" rx="5"/><circle cx="12" cy="12" r="4"/><circle cx="17.5" cy="6.5" r="1" fill="currentColor" stroke="none"/></svg>'
ICO_TT='<svg viewBox="0 0 24 24" fill="currentColor"><path d="M16.5 3c.4 2.4 1.9 4 4.5 4.3v3.2c-1.7 0-3.2-.5-4.5-1.4v6.4A6.1 6.1 0 1 1 10.4 9.4v3.3a2.9 2.9 0 1 0 2.9 2.9V3h3.2z"/></svg>'
ICO_FB='<svg viewBox="0 0 24 24" fill="currentColor"><path d="M13.5 21v-7h2.4l.4-3h-2.8V9.2c0-.9.3-1.5 1.5-1.5h1.5V5.1c-.3 0-1.2-.1-2.2-.1-2.2 0-3.7 1.3-3.7 3.8V11H8v3h2.6v7h2.9z"/></svg>'
ICO_PLAY='<svg viewBox="0 0 10 10"><path d="M1 0l8 5-8 5z"/></svg>'

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

header() { # $1 active page key
local a=$1
cat <<EOF
<header class="site-header">
  <div class="announce"><span class="msg"><strong>Free shipping</strong> on orders over \$100<span class="msg-l"> &nbsp;·&nbsp; \$5 flat rate otherwise &nbsp;·&nbsp; DM on Instagram to order</span></span><button class="close" aria-label="Dismiss">$ICO_X</button></div>
  <div class="nav-card">
    <button class="burger" aria-label="Open menu"><span></span><span></span><span></span></button>
    <nav class="nav-links">
      <a href="jewelry.html"$( [ "$a" = jewelry ] && echo ' class="active"')>Jewelry</a>
      <a href="clothing.html"$( [ "$a" = clothing ] && echo ' class="active"')>Clothing</a>
    </nav>
    <a class="brand" href="index.html">Sajaira</a>
    <div class="nav-utils">
      <a class="text$( [ "$a" = about ] && echo ' active')" href="about.html">About</a>
      <a class="icon-btn" href="$IG_J" target="_blank" rel="noopener" aria-label="Instagram">$ICO_IG<span class="text">Instagram</span></a>
    </div>
  </div>
</header>
<div class="drawer" aria-hidden="true">
  <div class="scrim"></div>
  <div class="panel">
    <a class="brand" href="index.html">Sajaira</a>
    <button class="close-x" aria-label="Close menu">$ICO_X</button>
    <nav>
      <a href="index.html">Home</a>
      <a href="jewelry.html">Jewelry</a>
      <a href="clothing.html">Clothing</a>
      <a href="about.html">About</a>
      <a href="policy.html">Policies</a>
    </nav>
    <div class="small">
      <a href="$IG_J" target="_blank" rel="noopener">@sajaira.jewelry</a>
      <a href="$IG_C" target="_blank" rel="noopener">@sajaira.clothing</a>
    </div>
  </div>
</div>
EOF
}

connect() { cat <<EOF
<section class="connect">
  <img src="images/brand/jewelry-tags.jpg" alt="">
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

connect_ig() { cat <<EOF
<section class="connect">
  <img src="images/brand/jewelry-tags.jpg" alt="">
  <div class="inner">
    <p class="eyebrow light reveal">New drops land on Instagram first</p>
    <h2 class="reveal" data-delay="1">Follow us on Instagram</h2>
    <p class="reveal" data-delay="2">Live sales every Friday, fresh stock all week. Follow both pages and DM us to reserve your favourite before it sells out.</p>
    <div class="connect-actions reveal" data-delay="3">
      <a class="btn btn-light" href="$IG_J" target="_blank" rel="noopener">$ICO_IG Sajaira Jewelry Instagram</a>
      <a class="btn btn-outline-light" href="$IG_C" target="_blank" rel="noopener">$ICO_IG Sajaira Clothing Instagram</a>
    </div>
  </div>
</section>
EOF
}

# review IMG QUOTE SOURCE
review() { cat <<EOF
      <a class="review reveal" href="$IG_J" target="_blank" rel="noopener">
        <figure><img src="images/reviews/$1.jpg" alt="Customer review" loading="lazy"></figure>
        <p>&ldquo;$2&rdquo;</p>
        <div class="stars">★★★★★</div>
        <small>$3</small>
      </a>
EOF
}

reviews_section() { cat <<EOF
<section class="block" id="reviews">
  <div class="carousel-wrap">
    <div class="section-head reveal">
      <div><p class="eyebrow">Customer love</p><h2 class="title-lg">What our customers say</h2></div>
      <div class="arrows"><button class="arrow-btn c-prev" aria-label="Previous">$ICO_LEFT</button><button class="arrow-btn c-next" aria-label="Next">$ICO_RIGHT</button></div>
    </div>
    <div class="carousel reviews">
$(review quality "The product quality is very good. I am happy with my purchase. Excellent service and fast delivery!" "Instagram DM")
$(review eid-bangles "I wore your glass bangles on Eid day — so pretty." "Instagram story")
$(review unboxing "I had a great experience with this jewelry page. The designs are elegant, unique, and exactly as shown in the pictures." "@emu_ahmed02")
$(review necklace-set "Thank you, it's beautiful." "Instagram DM")
$(review gifts "Got gifts from @sajaira.jewelry!" "Instagram story")
$(review order-box "Guys, follow my sister-in-law's small business @sajaira.jewelry." "Instagram story")
$(review necklace-sold "Please support my sister's small business — your support means a lot." "@__ekram00__")
$(review dupatta "Thank you for sharing ❤️" "@l0ve.leena")
    </div>
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
        <p><a href="mailto:hello@sajaira.com">hello@sajaira.com</a><br><a href="tel:+19176981950">+1 (917) 698 1950</a></p>
        <div class="socials">
          <a href="$IG_J" target="_blank" rel="noopener" aria-label="Instagram">$ICO_IG</a>
          <a href="$TT" target="_blank" rel="noopener" aria-label="TikTok">$ICO_TT</a>
          <a href="$FB" target="_blank" rel="noopener" aria-label="Facebook">$ICO_FB</a>
        </div>
      </div>
      <div><h4>Shop</h4><ul><li><a href="jewelry.html">Jewelry</a></li><li><a href="clothing.html">Clothing</a></li><li><a href="clothing.html#kids">Kids</a></li><li><a href="index.html#occasions">Occasions</a></li><li><a href="index.html#arrivals">New Arrivals</a></li></ul></div>
      <div><h4>Help</h4><ul><li><a href="about.html#contact">Contact</a></li><li><a href="about.html#payment">How to Pay</a></li><li><a href="policy.html#shipping">Shipping</a></li><li><a href="policy.html#returns">Returns &amp; Exchange</a></li><li><a href="policy.html#faq">FAQs</a></li></ul></div>
      <div><h4>About</h4><ul><li><a href="about.html">Our Story</a></li><li><a href="index.html#journal">Journal</a></li><li><a href="index.html#reels">Live Sales</a></li><li><a href="index.html#reviews">Reviews</a></li></ul></div>
      <div><h4>Follow</h4><ul><li><a href="$IG_J" target="_blank" rel="noopener">@sajaira.jewelry</a></li><li><a href="$IG_C" target="_blank" rel="noopener">@sajaira.clothing</a></li><li><a href="$TT" target="_blank" rel="noopener">TikTok @sajaira04</a></li><li><a href="$FB" target="_blank" rel="noopener">Facebook</a></li></ul></div>
    </div>
    <div class="footer-bottom">
      <div class="legal">
        <span>&copy; 2026 Sajaira &middot; New York</span>
        <a href="policy.html#terms">Terms &amp; Conditions</a><a href="policy.html#returns">Return Policy</a><a href="policy.html#privacy">Privacy Policy</a>
      </div>
      <div class="pay"><span>VISA</span><span>MC</span><span>AMEX</span><span>APPLE PAY</span><span>PAYPAL</span><span>ZELLE</span></div>
    </div>
  </div>
</footer>
<button class="to-top">Back to top $ICO_UP</button>
<div class="modal" aria-hidden="true"><button class="close-x" aria-label="Close">$ICO_X</button><video controls playsinline preload="none"></video></div>
<script src="js/main.js?v=$V"></script>
</body>
</html>
EOF
}

# product NAME PRICE IMG ALTIMG SWATCHES TAG IGURL [cats] [extra-class]
product() {
cat <<EOF
      <article class="product reveal $9" data-cat="$8">
        <a class="product-media" href="$7" target="_blank" rel="noopener">
          <img class="main" src="$3" alt="$1" loading="lazy"><img class="alt" src="$4" alt="" loading="lazy">
          $( [ -n "$6" ] && echo "<span class=\"pill dark tag\">$6</span>" )
          <span class="dm">DM to order</span>
        </a>
        <h3>$1</h3>
        <p class="price">$2</p>
        <div class="swatches">$5</div>
      </article>
EOF
}

# reel NAME CAPTION-SMALL CAPTION
reel() { cat <<EOF
      <div class="reel reveal" data-play="video/brand/$1.mp4" data-portrait>
        <img src="images/posters/$1.jpg" alt="" loading="lazy"><video muted loop playsinline preload="none" poster="images/posters/$1.jpg"><source src="video/brand/$1.mp4" type="video/mp4"></video>
        <span class="pl">$ICO_PLAY</span>
        <div class="cap"><small>$2</small>$3</div>
      </div>
EOF
}

reels_section() { # $1 id $2 eyebrow $3 title, then reel names...
local id=$1 eb=$2 title=$3; shift 3
cat <<EOF
<section class="reels-sec" id="$id">
  <div class="carousel-wrap">
    <div class="section-head reveal">
      <div><p class="eyebrow">$eb</p><h2 class="title-lg">$title</h2></div>
      <div class="arrows"><button class="arrow-btn c-prev" aria-label="Previous">$ICO_LEFT</button><button class="arrow-btn c-next" aria-label="Next">$ICO_RIGHT</button></div>
    </div>
    <div class="reels carousel">
EOF
for r in "$@"; do IFS='|' read -r n a b <<< "$r"; reel "$n" "$a" "$b"; done
cat <<EOF
    </div>
  </div>
</section>
EOF
}

# ---------------------------------------------------------------- INDEX
{
head "Sajaira — Deshi Jewelry &amp; Designer Clothing, New York" "Handpicked Deshi jewelry and designer sarees, kurtas and chikankari sets. Free US shipping over \$100."
header home
cat <<EOF
<main>
<section class="hero" aria-label="Featured">
  <div class="slide"><img src="images/brand/saree-pier.jpg" alt="">
    <div class="slide-content"><p class="eyebrow light">The Festive Edit 2026</p><h1>Light Up Your World</h1><p class="sub">Handpicked Deshi jewelry and designer clothing, curated in New York and shipped across the United States.</p><a class="link-u" href="clothing.html">Shop the Edit</a></div></div>
  <div class="slide"><img src="images/brand/bangles-wrist.jpg" alt="">
    <div class="slide-content"><p class="eyebrow light">Jewelry</p><h1>Grace in Every Color</h1><p class="sub">Glass bangles, statement earrings and cocktail rings — the sparkle of home, delivered to your door.</p><a class="link-u" href="jewelry.html">Shop Jewelry</a></div></div>
  <div class="slide"><img src="images/brand/kurta-blue-model.jpg" alt="">
    <div class="slide-content"><p class="eyebrow light">Clothing</p><h1>Timeless Tradition, Modern You</h1><p class="sub">Embroidered kurta sets, designer sarees and lawn suits in the season's colours.</p><a class="link-u" href="clothing.html">Shop Clothing</a></div></div>
  <div class="hero-ui">
    <span class="hero-count">01 / 03</span>
    <div class="hero-dots"></div>
    <div class="hero-arrows"><button class="arrow-btn hero-prev" aria-label="Previous">$ICO_LEFT</button><button class="arrow-btn hero-next" aria-label="Next">$ICO_RIGHT</button></div>
  </div>
  <div class="scroll-hint"></div>
</section>

<section class="block tight">
  <div class="section-head reveal">
    <div><p class="eyebrow">Discover</p><h2 class="title-lg">Shop by Category</h2></div>
    <a class="link-arrow" href="jewelry.html">Shop All $ICO_ARROW</a>
  </div>
  <div class="cats">
    <a class="cat reveal" href="jewelry.html#earrings"><img src="images/jewelry/01.jpg" alt=""><span>Earrings</span></a>
    <a class="cat reveal" data-delay="1" href="jewelry.html#bangles"><img src="images/brand/bangles-multi.jpg" alt=""><span>Bangles</span></a>
    <a class="cat reveal" data-delay="2" href="jewelry.html#rings"><img src="images/brand/rings-bag.jpg" alt=""><span>Rings</span></a>
    <a class="cat reveal" data-delay="3" href="clothing.html#sarees"><img src="images/brand/saree-purple-poster.jpg" alt=""><span>Sarees</span></a>
    <a class="cat reveal" data-delay="1" href="clothing.html#kurtas"><img src="images/brand/kurta-mint-model.jpg" alt=""><span>Kurta Sets</span></a>
    <a class="cat reveal" data-delay="2" href="clothing.html#kids"><img src="images/posters/kids-yellow.jpg" alt=""><span>Kids</span></a>
  </div>
</section>

<section class="block tight">
  <div class="feature reveal">
    <div class="feature-panel">
      <div class="top">
        <p class="eyebrow">Festive Edit 2026</p>
        <h2>Where tradition meets the everyday.</h2>
        <p class="desc">Our new season brings hand-embroidered kurta sets, statement gold and glass bangles in every colour — made to be worn from the mehendi to the morning after.</p>
      </div>
      <div class="bottom">
        <div data-f="0"><p class="product-line"><span>Purple Zari Saree</span><span>\$145</span></p><a class="link-u" href="clothing.html#sarees">View Product</a></div>
        <div data-f="1"><p class="product-line"><span>Gold Glass Bangles</span><span>\$32</span></p><a class="link-u" href="jewelry.html#bangles">View Product</a></div>
        <div data-f="2"><p class="product-line"><span>Mint Embroidered Set</span><span>\$120</span></p><a class="link-u" href="clothing.html#kurtas">View Product</a></div>
        <div class="dots"></div>
      </div>
    </div>
    <div class="feature-media">
      <img src="images/brand/saree-purple-poster.jpg" alt="">
      <img src="images/brand/bangles-wrist.jpg" alt="">
      <img src="images/brand/kurta-mint-model.jpg" alt="">
    </div>
  </div>
</section>

<section class="block" id="arrivals">
  <div class="carousel-wrap">
    <div class="section-head reveal">
      <div><p class="eyebrow">Just landed</p><h2 class="title-lg">New Arrivals</h2></div>
      <div class="arrows"><button class="arrow-btn c-prev" aria-label="Previous">$ICO_LEFT</button><button class="arrow-btn c-next" aria-label="Next">$ICO_RIGHT</button></div>
    </div>
    <div class="carousel">
$(product "Pink Glass Bangles" "\$28" images/brand/bangles-pink-hand.jpg images/brand/bangles-pink-pack.jpg '<i style="--c:#e0257a"></i><i style="--c:#2ea36b"></i><i style="--c:#c9b26b"></i><span>+4 colours</span>' New "$IG_J")
$(product "Mint Embroidered Kurta Set" "\$120" images/brand/kurta-mint-model.jpg images/brand/kurta-white-model.jpg '<i style="--c:#cfe3df"></i><i style="--c:#f4f4f4"></i>' New "$IG_C")
$(product "Noor Chandelier Earrings" "\$48" images/jewelry/01.jpg images/jewelry/02.jpg '<i style="--c:#4fb3c9"></i><i style="--c:#a4232b"></i><span>+2 colours</span>' "" "$IG_J")
$(product "Lilac Lawn Suit" "\$95" images/brand/kurta-purple-flat.jpg images/brand/kurta-grey-flat.jpg '<i style="--c:#b39ddb"></i><i style="--c:#9aa7b8"></i><i style="--c:#7fa6cc"></i>' New "$IG_C")
$(product "Gold Glass Bangles" "\$32" images/brand/bangles-wrist.jpg images/jewelry/10.jpg '<i style="--c:#c9b26b"></i><i style="--c:#b8923a"></i>' "" "$IG_J")
$(product "Black Zari Kurta Set" "\$135" images/brand/kurta-black-model.jpg images/posters/kurta-black-embroidered.jpg '<i style="--c:#1c1b1a"></i>' New "$IG_C")
$(product "Meera Cocktail Rings" "\$28" images/brand/rings-bag.jpg images/jewelry/06.jpg '<i style="--c:#e8e8e8"></i><i style="--c:#b8923a"></i>' "" "$IG_J")
$(product "Purple Zari Saree" "\$145" images/brand/saree-purple-poster.jpg images/posters/saree-purple-model.jpg '<i style="--c:#5b2a7a"></i><i style="--c:#d0a24a"></i>' "" "$IG_C")
    </div>
  </div>
</section>

<section class="occasions" id="occasions">
  <p class="eyebrow reveal">Shop by occasion</p>
  <div class="occ-stage reveal">
    <figure class="occ-img left"></figure>
    <ul class="occ-list">
      <li data-left="images/brand/saree-purple-poster.jpg" data-right="images/brand/jewelry-poster-necklace.jpg"><a href="clothing.html#sarees">Wedding</a></li>
      <li data-left="images/brand/kurta-white-model.jpg" data-right="images/brand/bangles-wrist.jpg"><a href="clothing.html#kurtas">Eid</a></li>
      <li data-left="images/brand/bangles-pink-hand.jpg" data-right="images/brand/kurta-floral-flat.jpg"><a href="jewelry.html#bangles">Mehendi</a></li>
      <li data-left="images/brand/kurta-black-model.jpg" data-right="images/brand/earrings-poster.jpg"><a href="clothing.html">Festive</a></li>
      <li data-left="images/brand/kurta-blue-flat.jpg" data-right="images/brand/rings-bag.jpg"><a href="clothing.html#lawn">Everyday</a></li>
    </ul>
    <figure class="occ-img right"></figure>
  </div>
  <a class="link-arrow reveal" href="clothing.html">Shop by occasion $ICO_ARROW</a>
</section>

<section class="video-hero">
  <video autoplay muted loop playsinline poster="images/posters/fabric-embroidered.jpg"><source src="video/brand/fabric-embroidered.mp4" type="video/mp4"></video>
  <div class="overlay">
    <p class="eyebrow light reveal">Clothing</p>
    <h2 class="reveal" data-delay="1">The Saree Edit</h2>
    <p class="lede reveal" data-delay="2">Explore our new season.</p>
    <a class="btn btn-light reveal" data-delay="3" href="clothing.html#sarees">Explore Now</a>
    <button class="play reveal" data-delay="3" data-play="video/brand/saree-pink-model.mp4" data-portrait><i>$ICO_PLAY</i>Play video</button>
  </div>
</section>

$(reels_section reels "Live on Instagram" "Latest Reels" "saree-pink-model|Saree|Pink tissue saree" "kurta-green|Kurta set|Olive embroidered kurta" "kurta-yellow|Kurta set|Yellow gharara set" "saree-lavender-model|Saree|Lavender organza" "kurta-black-embroidered|Kurta set|Black zari" "kids-yellow|Kids|Little charm" "saree-purple-model|Saree|Purple zari" "parcels|Live sale|Friday parcels")

<section class="block">
  <div class="campaign-media reveal">
    <figure><img src="images/brand/saree-pier.jpg" alt="" loading="lazy"></figure>
    <figure><img src="images/brand/jewelry-poster-necklace.jpg" alt="" loading="lazy"></figure>
  </div>
  <div class="campaign-text reveal">
    <div>
      <span class="pill">Campaign</span>
      <h2>A Season of Light</h2>
      <p>Our Festive Edit 2026 unfolds as A Season of Light — where the wedding tent softens into a living room, and every evening becomes a reason to dress up. Photographed in New York with the pieces we love most.</p>
    </div>
    <a class="link-u" href="clothing.html">Discover the Collection</a>
  </div>
</section>

<section class="block tight" id="journal">
  <div class="journal reveal">
    <div class="journal-head">
      <h2>Journal</h2>
      <div class="tabs"><button class="active" data-filter="all">Read All</button><button data-filter="campaign">Campaigns</button><button data-filter="lookbook">Lookbooks</button><button data-filter="story">Stories</button></div>
    </div>
    <div class="journal-row" data-cat="campaign">
      <article><span class="pill">Campaign</span><h3>A Season of Light</h3><p>Festive Edit 2026 unfolds as A Season of Light, where every evening becomes a reason to dress up and the pieces do the talking.</p><a class="link-u" href="#">Read More</a></article>
      <article><span class="pill">Lookbook</span><h3>The Lawn Edit</h3><p>Printed lawn suits in lilac, grey and sky blue — six ways to wear this season's sets from brunch to baraat.</p><a class="link-u" href="clothing.html#lawn">Read More</a></article>
      <figure><img src="images/brand/kurta-floral-flat.jpg" alt="" loading="lazy"></figure>
    </div>
    <div class="journal-row" data-cat="lookbook">
      <article><span class="pill">Lookbook</span><h3>Bangles, Stacked</h3><p>Glass, zari and metal — how we layer bangles for weight, colour and the perfect chime.</p><a class="link-u" href="jewelry.html#bangles">Read More</a></article>
      <article><span class="pill">Story</span><h3>Why We Photograph Everything Ourselves</h3><p>What you see on our page is exactly what arrives at your door. A short note on honest photography.</p><a class="link-u" href="about.html">Read More</a></article>
      <figure><img src="images/brand/bangles-multi.jpg" alt="" loading="lazy"></figure>
    </div>
    <div class="journal-row" data-cat="story">
      <article><span class="pill">Story</span><h3>Live on Fridays</h3><p>Every Friday at 9pm we go live with fresh stock. Here's how the live sales work and how to reserve a piece.</p><a class="link-u" href="#reels">Read More</a></article>
      <article><span class="pill">Story</span><h3>From a Single Suitcase</h3><p>How Sajaira went from one suitcase of bangles to two Instagram shops and a studio in New York.</p><a class="link-u" href="about.html">Read More</a></article>
      <figure><img src="images/brand/gift-box.jpg" alt="" loading="lazy"></figure>
    </div>
  </div>
</section>

<section class="marquee-sec">
  <div class="marquee"><div class="marquee-track"><span>New Drop Every Friday —</span><span>New Drop Every Friday —</span><span>New Drop Every Friday —</span><span>New Drop Every Friday —</span></div></div>
  <figure class="marquee-product"><img src="images/brand/gift-box.jpg" alt="Sajaira gift box"></figure>
  <div class="marquee-caption reveal"><a class="link-u" href="$IG_J" target="_blank" rel="noopener">Join the live sale</a></div>
</section>

$(reviews_section)

<section class="block" style="padding-top:0">
  <div class="story">
    <div class="reveal">
      <h2>A Little Piece of Home</h2>
      <p>We started as a way to bring the jewelry and clothing we grew up loving to the Deshi community across the United States. One suitcase, a kitchen-table photo studio and a lot of DMs later, Sajaira is two Instagram shops and a small studio in New York.</p>
      <p>Every piece is handpicked, photographed by us and shipped from New York — free across the US on orders over \$100.</p>
      <a class="link-arrow" href="about.html">Find out more $ICO_ARROW</a>
    </div>
    <figure class="reveal" data-delay="1"><img src="images/brand/rings-bag.jpg" alt="" loading="lazy"></figure>
  </div>
</section>

<section class="block tight">
  <div class="ig-head reveal">
    <h2>@sajaira.jewelry &nbsp;/&nbsp; @sajaira.clothing</h2>
    <a class="link-arrow" href="$IG_J" target="_blank" rel="noopener">Follow us on Instagram $ICO_ARROW</a>
  </div>
  <div class="ig-grid">
    <a class="reveal" href="$IG_J" target="_blank" rel="noopener"><img src="images/brand/bangles-pink-hand.jpg" alt="" loading="lazy">$ICO_IG</a>
    <a class="reveal" data-delay="1" href="$IG_C" target="_blank" rel="noopener"><img src="images/brand/kurta-white-model.jpg" alt="" loading="lazy">$ICO_IG</a>
    <a class="reveal" data-delay="2" href="$IG_J" target="_blank" rel="noopener"><img src="images/jewelry/06.jpg" alt="" loading="lazy">$ICO_IG</a>
    <a class="reveal" data-delay="3" href="$IG_C" target="_blank" rel="noopener"><img src="images/brand/kurta-blue-flat.jpg" alt="" loading="lazy">$ICO_IG</a>
    <a class="reveal" data-delay="1" href="$IG_J" target="_blank" rel="noopener"><img src="images/brand/bangles-multi.jpg" alt="" loading="lazy">$ICO_IG</a>
    <a class="reveal" data-delay="2" href="$IG_C" target="_blank" rel="noopener"><img src="images/brand/saree-pier.jpg" alt="" loading="lazy">$ICO_IG</a>
  </div>
</section>

$(connect_ig)
</main>
EOF
footer
} > index.html

# ---------------------------------------------------------------- JEWELRY
{
head "Jewelry — Sajaira" "Glass bangles, statement earrings and cocktail rings. Deshi jewelry handpicked in New York, shipped across the US."
header jewelry
cat <<EOF
<main>
<section class="collection-hero">
  <img src="images/brand/bangles-wrist.jpg" alt="">
  <div class="inner">
    <div><p class="eyebrow light">Collection 01</p><h1>Jewelry</h1><p class="sub">Glass bangles in every colour, chandelier earrings and cocktail rings — the sparkle of home, delivered to your door.</p></div>
    <span class="count">13 pieces &middot; DM to order</span>
  </div>
</section>

<section class="block tight">
  <div class="chips reveal" data-target="#jgrid">
    <button class="active" data-filter="all">All</button><button data-filter="bangles">Bangles</button><button data-filter="earrings">Earrings</button><button data-filter="rings">Rings</button><button data-filter="sets">Sets &amp; Gifts</button>
  </div>
  <div class="pgrid" id="jgrid">
$(product "Pink Glass Bangles" "\$28" images/brand/bangles-pink-hand.jpg images/brand/bangles-pink-pack.jpg '<i style="--c:#e0257a"></i><i style="--c:#2ea36b"></i><i style="--c:#c9b26b"></i><span>+4 colours</span>' New "$IG_J" bangles)
$(product "Rainbow Bangle Set" "\$36" images/brand/bangles-multi.jpg images/brand/bangles-pink-pack.jpg '<i style="--c:#e0257a"></i><i style="--c:#2b7bbf"></i><i style="--c:#e2b400"></i><i style="--c:#2ea36b"></i>' New "$IG_J" bangles)
$(product "Gold Glass Bangles" "\$32" images/brand/bangles-wrist.jpg images/jewelry/10.jpg '<i style="--c:#c9b26b"></i><i style="--c:#b8923a"></i>' "" "$IG_J" bangles)
$(product "Sky Glass Bangles" "\$32" images/jewelry/03.jpg images/jewelry/10.jpg '<i style="--c:#9cd3e6"></i><i style="--c:#d8d8d8"></i>' "" "$IG_J" bangles)
$(product "Noor Chandelier Earrings" "\$48" images/jewelry/01.jpg images/brand/earrings-poster.jpg '<i style="--c:#4fb3c9"></i><i style="--c:#b8923a"></i><span>+2 colours</span>' "" "$IG_J" earrings)
$(product "Gulab Stone Drops" "\$42" images/jewelry/02.jpg images/jewelry/01.jpg '<i style="--c:#a4232b"></i><i style="--c:#2c6b3f"></i>' "" "$IG_J" earrings)
$(product "Grace in Every Color — Earrings" "\$38" images/brand/earrings-poster.jpg images/jewelry/02.jpg '<i style="--c:#7fa6cc"></i><i style="--c:#e88fb0"></i><i style="--c:#b8923a"></i><span>+5 colours</span>' New "$IG_J" earrings)
$(product "Meera Cocktail Rings" "\$28" images/brand/rings-bag.jpg images/jewelry/06.jpg '<i style="--c:#e8e8e8"></i><i style="--c:#b8923a"></i>' "" "$IG_J" rings)
$(product "Gemstone Ring Edit" "\$24" images/jewelry/06.jpg images/jewelry/04.jpg '<i style="--c:#a4232b"></i><i style="--c:#2c6b3f"></i><i style="--c:#2b7bbf"></i>' "" "$IG_J" rings)
$(product "Crystal Statement Ring" "\$26" images/jewelry/04.jpg images/jewelry/06.jpg '<i style="--c:#e8e8e8"></i>' "" "$IG_J" rings)
$(product "Timeless Tradition Necklace Set" "\$160" images/brand/jewelry-poster-necklace.jpg images/jewelry/09.jpg '<i style="--c:#b8923a"></i>' New "$IG_J" sets)
$(product "Sajaira Gift Box" "\$85" images/brand/gift-box.jpg images/brand/jewelry-tags.jpg '<i style="--c:#e88fb0"></i><i style="--c:#b8923a"></i>' "" "$IG_J" sets)
$(product "Bangle Box — Size 2.10" "\$30" images/brand/bangles-box-sizes.jpg images/posters/bangles-box.jpg '<i style="--c:#2ea36b"></i><i style="--c:#e2b400"></i><i style="--c:#2b7bbf"></i><i style="--c:#a4232b"></i><span>+6 colours</span>' New "$IG_J" bangles)
  </div>
</section>

<section class="block tight" id="bangles">
  <div class="split reveal">
    <div class="panel">
      <p class="eyebrow">Bangles</p>
      <h2>Every colour of the celebration.</h2>
      <p>Glass, zari and metal bangles sold in sets — pink, emerald, sapphire, mustard and gold. Tell us your wrist size and the outfit, and we'll match a set to it.</p>
      <a class="btn btn-dark" href="$IG_J" target="_blank" rel="noopener">DM to order</a>
    </div>
    <figure><img src="images/brand/bangles-pink-pack.jpg" alt=""></figure>
  </div>
</section>

<section class="block tight" id="earrings" style="padding-top:0">
  <div class="split flip reveal">
    <div class="panel">
      <p class="eyebrow">Earrings &amp; sets</p>
      <h2>Timeless tradition, modern you.</h2>
      <p>Exquisite craftsmanship and heritage you can wear. Chandelier earrings, layered necklace sets and statement pieces for the wedding season.</p>
      <a class="btn btn-dark" href="$IG_J" target="_blank" rel="noopener">DM to order</a>
    </div>
    <figure><img src="images/brand/jewelry-poster-necklace.jpg" alt=""></figure>
  </div>
</section>

<section class="block tight" id="rings" style="padding-top:0">
  <div class="perks">
    <div class="perk reveal"><strong>\$5 flat shipping</strong><span>Free on every order over \$100, all fifty states.</span></div>
    <div class="perk reveal" data-delay="1"><strong>Gift-ready</strong><span>Every set is tagged and boxed, ready to hand over.</span></div>
    <div class="perk reveal" data-delay="2"><strong>Live every Friday</strong><span>Fresh stock at 9pm EST on @sajaira.jewelry.</span></div>
  </div>
</section>

$(reels_section jreels "@sajaira.jewelry" "Jewelry on Reels" "bangles-box|Bangles|Every girl's special treat" "parcels|Live sale|Friday parcels" "bridal-poster|Bridal|Timeless beauty" "saree-gold-model|Styling|Gold with saree" "kurta-lilac-poster|Styling|Bangles with lawn")

$(connect_ig)
</main>
EOF
footer
} > jewelry.html

# ---------------------------------------------------------------- CLOTHING
{
head "Clothing — Sajaira" "Designer sarees, embroidered kurta sets, lawn suits and kids' Punjabi. Handpicked in New York, shipped across the US."
header clothing
cat <<EOF
<main>
<section class="collection-hero">
  <video autoplay muted loop playsinline poster="images/posters/saree-red-fabric.jpg"><source src="video/brand/saree-red-fabric.mp4" type="video/mp4"></video>
  <div class="inner">
    <div><p class="eyebrow light">Collection 02</p><h1>Clothing</h1><p class="sub">Designer sarees, hand-embroidered kurta sets, printed lawn suits and Punjabi for the little ones.</p></div>
    <span class="count">14 styles &middot; DM to order</span>
  </div>
</section>

<section class="block tight">
  <div class="chips reveal" data-target="#cgrid">
    <button class="active" data-filter="all">All</button><button data-filter="sarees">Sarees</button><button data-filter="kurtas">Kurta Sets</button><button data-filter="lawn">Lawn Suits</button><button data-filter="kids">Kids</button>
  </div>
  <div class="pgrid" id="cgrid">
$(product "Purple Zari Saree" "\$145" images/brand/saree-purple-poster.jpg images/posters/saree-purple-model.jpg '<i style="--c:#5b2a7a"></i><i style="--c:#d0a24a"></i>' New "$IG_C" sarees)
$(product "Champagne Sequin Saree" "\$165" images/brand/saree-pier.jpg images/posters/saree-gold-model.jpg '<i style="--c:#d9c5a3"></i>' "" "$IG_C" sarees)
$(product "Pink Tissue Saree" "\$150" images/posters/saree-pink-model.jpg images/posters/saree-brown-poster.jpg '<i style="--c:#e6b3c0"></i><i style="--c:#8b5a3c"></i>' New "$IG_C" sarees)
$(product "Lavender Organza Saree" "\$155" images/posters/saree-lavender-model.jpg images/posters/saree-purple-model.jpg '<i style="--c:#b39ddb"></i>' "" "$IG_C" sarees)
$(product "Mint Embroidered Kurta Set" "\$120" images/brand/kurta-mint-model.jpg images/brand/kurta-white-model.jpg '<i style="--c:#cfe3df"></i><i style="--c:#f4f4f4"></i>' New "$IG_C" kurtas)
$(product "Black Zari Kurta Set" "\$135" images/brand/kurta-black-model.jpg images/posters/kurta-black-embroidered.jpg '<i style="--c:#1c1b1a"></i>' "" "$IG_C" kurtas)
$(product "White Chikankari Set" "\$125" images/brand/kurta-white-model.jpg images/brand/kurta-mint-model.jpg '<i style="--c:#f4f4f4"></i>' "" "$IG_C" kurtas)
$(product "Olive Embroidered Kurta" "\$110" images/posters/kurta-green.jpg images/posters/kurta-yellow.jpg '<i style="--c:#8fa35a"></i><i style="--c:#f2c230"></i>' New "$IG_C" kurtas)
$(product "Blue Printed Palazzo Set" "\$98" images/brand/kurta-blue-model.jpg images/brand/kurta-blue-flat.jpg '<i style="--c:#3f6fb5"></i>' "" "$IG_C" "kurtas lawn")
$(product "Lilac Lawn Suit" "\$95" images/brand/kurta-purple-flat.jpg images/brand/kurta-grey-flat.jpg '<i style="--c:#b39ddb"></i><i style="--c:#9aa7b8"></i>' New "$IG_C" lawn)
$(product "Grey Chikan Lawn Suit" "\$95" images/brand/kurta-grey-flat.jpg images/brand/kurta-blue-flat.jpg '<i style="--c:#9aa7b8"></i>' "" "$IG_C" lawn)
$(product "Floral Lawn Suit" "\$92" images/brand/kurta-floral-flat.jpg images/posters/lawn-set-flat.jpg '<i style="--c:#e88fb0"></i><i style="--c:#7fa6cc"></i>' "" "$IG_C" lawn)
$(product "Little Charm Punjabi" "\$55" images/posters/kids-boy-poster.jpg images/posters/kids-punjabi-poster.jpg '<i style="--c:#3f6fb5"></i><i style="--c:#f4f4f4"></i>' New "$IG_C" kids)
$(product "Kids Yellow Anarkali" "\$60" images/posters/kids-yellow.jpg images/posters/kids-punjabi-poster.jpg '<i style="--c:#f2c230"></i>' "" "$IG_C" kids)
  </div>
</section>

<section class="block tight" id="sarees">
  <div class="split reveal">
    <div class="panel">
      <p class="eyebrow">Sarees</p>
      <h2>Grace in every drape.</h2>
      <p>Tissue, organza and zari sarees photographed on real bodies in real light. Blouse pieces included; stitching available on request.</p>
      <a class="btn btn-dark" href="$IG_C" target="_blank" rel="noopener">DM to order</a>
      <button class="play" data-play="video/brand/saree-pink-model.mp4" data-portrait style="display:inline-flex;align-items:center;gap:10px;font-size:11px;letter-spacing:.16em;text-transform:uppercase;margin-top:18px"><i style="width:28px;height:28px;border-radius:50%;border:1px solid var(--ink);display:grid;place-items:center"><svg viewBox="0 0 10 10" style="width:9px;height:9px;fill:var(--ink);margin-left:2px"><path d="M1 0l8 5-8 5z"/></svg></i>Watch the drape</button>
    </div>
    <figure><video autoplay muted loop playsinline poster="images/posters/saree-purple-model.jpg"><source src="video/brand/saree-purple-model.mp4" type="video/mp4"></video></figure>
  </div>
</section>

<section class="block tight" id="kurtas" style="padding-top:0">
  <div class="split flip reveal">
    <div class="panel">
      <p class="eyebrow">Kurta sets</p>
      <h2>Timeless black, golden grace.</h2>
      <p>Hand-embroidered three-piece sets — kurta, trousers and dupatta — in sizes S to XL. Soft, comfortable fabrics made for long evenings.</p>
      <a class="btn btn-dark" href="$IG_C" target="_blank" rel="noopener">DM to order</a>
    </div>
    <figure><img src="images/brand/kurta-black-model.jpg" alt=""></figure>
  </div>
</section>

<section class="block tight" id="lawn" style="padding-top:0">
  <div class="split reveal">
    <div class="panel">
      <p class="eyebrow">Lawn suits</p>
      <h2>Printed, breezy, everyday.</h2>
      <p>Unstitched and ready-to-wear lawn in lilac, grey, sky and floral prints. The easiest thing to throw on for brunch, work and Eid mornings.</p>
      <a class="btn btn-dark" href="$IG_C" target="_blank" rel="noopener">DM to order</a>
    </div>
    <figure><img src="images/brand/kurta-floral-flat.jpg" alt=""></figure>
  </div>
</section>

$(reels_section creels "@sajaira.clothing" "Clothing on Reels" "kurta-green|Kurta set|Olive embroidered" "kurta-yellow|Kurta set|Yellow gharara" "saree-lavender-model|Saree|Lavender organza" "kurta-red-model|Kurta set|Which colour?" "kurta-navy-model|Kurta set|Navy embroidered" "kurta-floral-model|Lawn|Floral print" "saree-gold-model|Saree|Golden grace" "kurta-black-embroidered|Kurta set|Black zari")

<section class="block" id="kids">
  <div class="split flip reveal">
    <div class="panel">
      <p class="eyebrow">Little Charm</p>
      <h2>Punjabi for the little ones.</h2>
      <p>Traditional Punjabi and anarkali sets for kids — because the smallest guests deserve the best outfit at the wedding.</p>
      <a class="btn btn-dark" href="$IG_C" target="_blank" rel="noopener">DM to order</a>
    </div>
    <figure><video autoplay muted loop playsinline poster="images/posters/kids-yellow.jpg"><source src="video/brand/kids-yellow.mp4" type="video/mp4"></video></figure>
  </div>
</section>

$(connect_ig)
</main>
EOF
footer
} > clothing.html

# ---------------------------------------------------------------- POLICY
{
head "Policies — Sajaira" "Shipping, returns, terms and privacy for Sajaira orders."
header policy
cat <<EOF
<main>
<section class="policy-hero">
  <p class="eyebrow">Policies</p>
  <h1>Terms &amp; Policies</h1>
  <p>Everything you need to know about ordering from Sajaira — shipping, returns, payment and how we look after your details. Questions? Email <a href="mailto:hello@sajaira.com" style="border-bottom:1px solid var(--ink)">hello@sajaira.com</a> or call <a href="tel:+19176981950" style="border-bottom:1px solid var(--ink)">+1 (917) 698 1950</a>.</p>
</section>
<section class="block tight" style="padding-top:24px">
  <div class="policy-wrap">
    <nav class="policy-nav reveal">
      <a href="#shipping">Shipping</a>
      <a href="#returns">Returns &amp; Exchange</a>
      <a href="#orders">Orders &amp; Payment</a>
      <a href="#terms">Terms &amp; Conditions</a>
      <a href="#privacy">Privacy</a>
      <a href="#faq">FAQs</a>
    </nav>
    <div class="policy-body">
      <p class="updated">Last updated September 2026</p>

      <section id="shipping">
        <h2>Shipping</h2>
        <div class="callout"><strong>Shipping is a flat \$5.</strong> Orders over \$100 ship free anywhere in the United States.</div>
        <p>We ship from New York to all fifty states via USPS. Orders are dispatched within 2 business days of payment being confirmed, and typically arrive in 3–7 business days. You'll receive a tracking number by Instagram DM once your parcel is on its way.</p>
        <h3>Pre-orders &amp; live-sale items</h3>
        <p>Pieces reserved during a live sale are shipped together once payment for the full order is received. Pre-order items ship on the date stated at the time of ordering.</p>
        <h3>Lost or damaged parcels</h3>
        <p>Please check your parcel on arrival and message us within 48 hours with photos if anything has arrived damaged. Once a parcel is marked delivered by the carrier we are unable to replace it, so please use a secure delivery address.</p>
      </section>

      <section id="returns">
        <h2>Returns &amp; Exchange</h2>
        <div class="callout"><strong>No refund &nbsp;|&nbsp; No return &nbsp;|&nbsp; No exchange.</strong> Please be sure about your selection before buying.</div>
        <p>Because most of our pieces are single-stock, handpicked items, all sales are final. We photograph and film every piece ourselves so what you see is exactly what arrives — if you'd like extra photos, measurements or a colour check before ordering, just ask over DM and we'll happily send them.</p>
        <h3>Wrong or faulty item</h3>
        <p>If we've sent the wrong piece, or an item arrives with a manufacturing fault, message us within 48 hours of delivery with photos and we'll make it right with a replacement or refund.</p>
        <h3>Sizing</h3>
        <p>Bangles are sold by size (e.g. 2.4, 2.6, 2.8, 2.10). Please confirm your size before ordering — we're glad to help you measure. Clothing sizes follow the size chart shared for each piece.</p>
      </section>

      <section id="orders">
        <h2>Orders &amp; Payment</h2>
        <p>Orders are placed by DM on <a href="$IG_J" target="_blank" rel="noopener">@sajaira.jewelry</a> or <a href="$IG_C" target="_blank" rel="noopener">@sajaira.clothing</a>. Once we confirm availability and your total, you can pay with Zelle — scan the QR code or send to Sajaira LLC at (917) 698 1950. See <a href="about.html#payment">How to Pay</a>.</p>
        <p>An item is reserved for you once payment is received. Reserved-but-unpaid items are released after 24 hours. Prices are in US dollars and exclude shipping unless stated.</p>
      </section>

      <section id="terms">
        <h2>Terms &amp; Conditions</h2>
        <p>By placing an order with Sajaira you agree to the terms on this page. Sajaira is a small, independently run business based in New York, USA.</p>
        <ul>
          <li>All product photos and videos are our own; colours may vary slightly between screens and in different lighting.</li>
          <li>We reserve the right to cancel and refund an order if an item is found to be out of stock or was listed in error.</li>
          <li>Content on this site and our social channels (photos, videos, text) belongs to Sajaira and may not be reused without permission.</li>
          <li>These terms are governed by the laws of the State of New York.</li>
        </ul>
      </section>

      <section id="privacy">
        <h2>Privacy Policy</h2>
        <p>We only collect what we need to fulfil your order: your name, shipping address, Instagram handle and payment confirmation. We never sell or share your details with third parties, and we don't store card details — payments are handled by the payment apps themselves.</p>
        <p>If you subscribe to our newsletter, we'll only email you about new drops and live sales, and you can unsubscribe at any time. To have your details removed, message us on Instagram, email <a href="mailto:hello@sajaira.com">hello@sajaira.com</a> or call <a href="tel:+19176981950">+1 (917) 698 1950</a>.</p>
      </section>

      <section id="faq">
        <h2>FAQs</h2>
        <h3>How do I order?</h3>
        <p>DM us the piece on Instagram. We'll confirm it's available, send your total, and reserve it once payment is received.</p>
        <h3>When are the live sales?</h3>
        <p>Every Friday at 9pm EST on @sajaira.jewelry. New stock is shown live and reserved first-come, first-served.</p>
        <h3>Do you ship outside the US?</h3>
        <p>Not at the moment — we currently ship to US addresses only.</p>
        <h3>How can I reach you?</h3>
        <p>Instagram DM is fastest. You can also email <a href="mailto:hello@sajaira.com">hello@sajaira.com</a> or call / text <a href="tel:+19176981950">+1 (917) 698 1950</a>.</p>
        <h3>Can I get more photos before I buy?</h3>
        <p>Always. Ask over DM and we'll send extra photos, video or measurements.</p>
      </section>
    </div>
  </div>
</section>
$(connect_ig)
</main>
EOF
footer
} > policy.html

# ---------------------------------------------------------------- ABOUT
{
head "About — Sajaira" "The story behind Sajaira, a New York based curator of Deshi jewelry and designer clothing."
header about
cat <<EOF
<main>
<section class="page-hero">
  <img src="images/brand/saree-pier.jpg" alt="">
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
    <figure class="reveal" data-delay="1"><img src="images/brand/bangles-wrist.jpg" alt="" loading="lazy"></figure>
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
    <figure class="color reveal" data-delay="1"><img src="images/brand/jewelry-tags.jpg" alt="" loading="lazy"></figure>
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
    <div class="reveal" data-delay="2"><div class="year">2023</div><h3>@sajaira.clothing</h3><p>Duis aute irure dolor in reprehenderit. Designer sarees and kurta sets join the edit under a second shop.</p></div>
    <div class="reveal" data-delay="3"><div class="year">2026</div><h3>Sajaira.com</h3><p>Excepteur sint occaecat cupidatat non proident. A home of our own, with free shipping across all fifty states.</p></div>
  </div>
</section>

$(reviews_section)

<section class="block tight" id="payment">
  <div class="payment">
    <div class="panel reveal">
      <p class="eyebrow">How to pay</p>
      <h2>Simple, secure payment.</h2>
      <p>We accept payment by <strong>Zelle</strong>. Once you've reserved a piece over DM, scan the QR code or send to the details below, and add your Instagram handle in the memo so we can match it to your order.</p>
      <div class="pay-methods">
        <div class="pay-method"><strong>Zelle name</strong><span>SAJAIRA LLC</span></div>
        <div class="pay-method"><strong>Zelle phone</strong><span><a href="tel:+19176981950">(917) 698 1950</a></span></div>
        <div class="pay-method"><strong>Account</strong><span>Bus Complete Chk (…6622)</span></div>
        <div class="pay-method"><strong>Support</strong><span><a href="mailto:hello@sajaira.com">hello@sajaira.com</a></span></div>
      </div>
      <ol class="pay-steps">
        <li><b>1</b><span>DM us the piece you want on Instagram — we'll confirm availability and your total (shipping \$5, free over \$100).</span></li>
        <li><b>2</b><span>Pay with Zelle by scanning the QR code or sending to (917) 698 1950, with your Instagram handle in the memo.</span></li>
        <li><b>3</b><span>Send us a screenshot of the payment and your shipping address. We ship within 2 business days.</span></li>
      </ol>
      <p style="margin-top:22px;font-size:12px;color:var(--maroon);font-weight:600;letter-spacing:.04em">No refund &nbsp;|&nbsp; No return &nbsp;|&nbsp; No exchange</p>
    </div>
    <div class="qr-card reveal" data-delay="1">
      <img src="images/brand/payment-qr.jpg" alt="Zelle QR code for Sajaira LLC">
      <h3>Scan to pay with Zelle</h3>
      <p>Open your banking app, choose Zelle and scan the code — it's registered to Sajaira LLC.</p>
      <a class="tag" href="images/brand/payment-flyer.jpg" target="_blank" rel="noopener">View full payment card</a>
    </div>
  </div>
</section>

<section class="block tight" id="contact">
  <div class="contact">
    <div class="contact-panel reveal">
      <p class="eyebrow">Get in touch</p>
      <h2>Questions, custom orders, or just to say hello.</h2>
      <p>DM us on Instagram, email <a href="mailto:hello@sajaira.com" style="border-bottom:1px solid var(--ink)">hello@sajaira.com</a> or call / text <a href="tel:+19176981950" style="border-bottom:1px solid var(--ink)">+1 (917) 698 1950</a> for any support or help — we reply to every message.</p>
      <dl>
        <dt>Jewelry</dt><dd><a href="$IG_J" target="_blank" rel="noopener">@sajaira.jewelry</a></dd>
        <dt>Clothing</dt><dd><a href="$IG_C" target="_blank" rel="noopener">@sajaira.clothing</a></dd>
        <dt>Email</dt><dd><a href="mailto:hello@sajaira.com">hello@sajaira.com</a></dd>
        <dt>Phone</dt><dd><a href="tel:+19176981950">+1 (917) 698 1950</a></dd>
        <dt>Studio</dt><dd>New York, USA — by appointment</dd>
        <dt>Shipping</dt><dd>Free across the US on orders over \$100</dd>
      </dl>
    </div>
    <div class="contact-media reveal" data-delay="1"><img src="images/brand/rings-bag.jpg" alt="" loading="lazy"></div>
  </div>
</section>

$(connect_ig)
</main>
EOF
footer
} > about.html
echo "built: index $(wc -c < index.html)  jewelry $(wc -c < jewelry.html)  clothing $(wc -c < clothing.html)  about $(wc -c < about.html)  policy $(wc -c < policy.html)"
