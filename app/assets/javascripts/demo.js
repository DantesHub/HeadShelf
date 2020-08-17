$.socialfloating({
  icons: "fontawesome5",
  buttons: [
    [
      {
        icon: "facebook-f",
        enabled: !0,
        link: `https://www.facebook.com/sharer/sharer.php?u=${window.location.href}`,
        color: "#3b5998",
      },
      {
        icon: "twitter",
        enabled: !0,
        link: `https://twitter.com/intent/tweet?url=${window.location.href}`,
        color: "#00aced",
      },
      {
        icon: "linkedin",
        enabled: !0,
        link: `https://www.linkedin.com/shareArticle?mini=true&url=${window.location.href}&title=&summary=&source=`,
        color: "#2774B0",
      },
      {
        icon: "pinterest",
        enabled: !0,
        link: `https://pinterest.com/pin/create/button/?url=${window.location.href}&media=&description=`,
        color: "#811302",
      },
    ],
    [
      {
        icon: "envelope",
        enabled: !0,
        link: `mailto:?&subject=&body=${window.location.href}`,
      },
    ],
  ],
});
console.log(`fasdfadsfasdfsdafasdfsdafsdafsdaf${window.location.href}`);
