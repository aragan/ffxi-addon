





<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
  <link rel="dns-prefetch" href="https://github.githubassets.com">
  <link rel="dns-prefetch" href="https://avatars0.githubusercontent.com">
  <link rel="dns-prefetch" href="https://avatars1.githubusercontent.com">
  <link rel="dns-prefetch" href="https://avatars2.githubusercontent.com">
  <link rel="dns-prefetch" href="https://avatars3.githubusercontent.com">
  <link rel="dns-prefetch" href="https://github-cloud.s3.amazonaws.com">
  <link rel="dns-prefetch" href="https://user-images.githubusercontent.com/">



  <link crossorigin="anonymous" media="all" integrity="sha512-FG+rXqMOivrAjdEQE7tO4BwM1poGmg70hJFTlNSxjX87grtrZ6UnPR8NkzwUHlQEGviu9XuRYeO8zH9YwvZhdg==" rel="stylesheet" href="https://github.githubassets.com/assets/frameworks-146fab5ea30e8afac08dd11013bb4ee0.css" />
  <link crossorigin="anonymous" media="all" integrity="sha512-4wqeyhMYSQckpc21w1+M0u9Xs9HT8ZyNP0+4uJMB8I5jL8pu7ypO+yBXXSpnzHdraeA9D9ZRqPu5jlNFnCPGQQ==" rel="stylesheet" href="https://github.githubassets.com/assets/site-e30a9eca1318490724a5cdb5c35f8cd2.css" />
    <link crossorigin="anonymous" media="all" integrity="sha512-xhEwXUnAQrwtzx3SUeDRw7/d7lQmtwNKXic7VeJinUexaePJ2knNKoM3SJzmSmDq/Stn081QrAsZJ8UU98Rw0w==" rel="stylesheet" href="https://github.githubassets.com/assets/github-c611305d49c042bc2dcf1dd251e0d1c3.css" />
    
    
    
    


  <meta name="viewport" content="width=device-width">
  
  <title>FFXIAddons/sleeper.lua at master · SammehFFXI/FFXIAddons · GitHub</title>
    <meta name="description" content="Contribute to SammehFFXI/FFXIAddons development by creating an account on GitHub.">
    <link rel="search" type="application/opensearchdescription+xml" href="/opensearch.xml" title="GitHub">
  <link rel="fluid-icon" href="https://github.com/fluidicon.png" title="GitHub">
  <meta property="fb:app_id" content="1401488693436528">

    <meta name="twitter:image:src" content="https://avatars2.githubusercontent.com/u/20287089?s=400&amp;v=4" /><meta name="twitter:site" content="@github" /><meta name="twitter:card" content="summary" /><meta name="twitter:title" content="SammehFFXI/FFXIAddons" /><meta name="twitter:description" content="Contribute to SammehFFXI/FFXIAddons development by creating an account on GitHub." />
    <meta property="og:image" content="https://avatars2.githubusercontent.com/u/20287089?s=400&amp;v=4" /><meta property="og:site_name" content="GitHub" /><meta property="og:type" content="object" /><meta property="og:title" content="SammehFFXI/FFXIAddons" /><meta property="og:url" content="https://github.com/SammehFFXI/FFXIAddons" /><meta property="og:description" content="Contribute to SammehFFXI/FFXIAddons development by creating an account on GitHub." />

  <link rel="assets" href="https://github.githubassets.com/">
  
  

  <meta name="request-id" content="65E6:3437:2F4EC:43B00:5EB403BE" data-pjax-transient="true"/><meta name="html-safe-nonce" content="71b46cb189102e47788d864e3142e403c47917d5" data-pjax-transient="true"/><meta name="visitor-payload" content="eyJyZWZlcnJlciI6Imh0dHBzOi8vZ2l0aHViLmNvbS9TYW1tZWhGRlhJL0ZGWElBZGRvbnMvdHJlZS9tYXN0ZXIvU2xlZXBlciIsInJlcXVlc3RfaWQiOiI2NUU2OjM0Mzc6MkY0RUM6NDNCMDA6NUVCNDAzQkUiLCJ2aXNpdG9yX2lkIjoiNzEwMjkyODI3NjE3NzM5MDg2NyIsInJlZ2lvbl9lZGdlIjoiYW1zIiwicmVnaW9uX3JlbmRlciI6ImFtcyJ9" data-pjax-transient="true"/><meta name="visitor-hmac" content="807d7671e50ef3ce9cf46f5defc230a3b1cbe89fe3e9c725e3ffa98653da156d" data-pjax-transient="true"/>



  <meta name="github-keyboard-shortcuts" content="repository,source-code" data-pjax-transient="true" />

  

  <meta name="selected-link" value="repo_source" data-pjax-transient>

    <meta name="google-site-verification" content="KT5gs8h0wvaagLKAVWq8bbeNwnZZK1r1XQysX3xurLU">
  <meta name="google-site-verification" content="ZzhVyEFwb7w3e0-uOTltm8Jsck2F5StVihD0exw2fsA">
  <meta name="google-site-verification" content="GXs5KoUUkNCoaAZn7wPN-t01Pywp9M3sEjnt_3_ZWPc">

<meta name="octolytics-host" content="collector.githubapp.com" /><meta name="octolytics-app-id" content="github" /><meta name="octolytics-event-url" content="https://collector.githubapp.com/github-external/browser_event" /><meta name="octolytics-dimension-ga_id" content="" class="js-octo-ga-id" />
<meta name="analytics-location" content="/&lt;user-name&gt;/&lt;repo-name&gt;/blob/show" data-pjax-transient="true" />


<meta name="optimizely-sdk-key" content="cowimJNste4j7QnBNCjaw" />

    <meta name="google-analytics" content="UA-3769691-2">


<meta class="js-ga-set" name="dimension1" content="Logged Out">



  

      <meta name="hostname" content="github.com">
    <meta name="user-login" content="">

      <meta name="expected-hostname" content="github.com">


    <meta name="enabled-features" content="MARKETPLACE_TRENDING_SOCIAL_PROOF,MARKETPLACE_RECOMMENDATIONS,MARKETPLACE_PENDING_INSTALLATIONS">

  <meta http-equiv="x-pjax-version" content="2d22c3a941d187cd6ec07fa161d9483a">
  

      <link href="https://github.com/SammehFFXI/FFXIAddons/commits/master.atom" rel="alternate" title="Recent Commits to FFXIAddons:master" type="application/atom+xml">

  <meta name="go-import" content="github.com/SammehFFXI/FFXIAddons git https://github.com/SammehFFXI/FFXIAddons.git">

  <meta name="octolytics-dimension-user_id" content="20287089" /><meta name="octolytics-dimension-user_login" content="SammehFFXI" /><meta name="octolytics-dimension-repository_id" content="77250642" /><meta name="octolytics-dimension-repository_nwo" content="SammehFFXI/FFXIAddons" /><meta name="octolytics-dimension-repository_public" content="true" /><meta name="octolytics-dimension-repository_is_fork" content="false" /><meta name="octolytics-dimension-repository_network_root_id" content="77250642" /><meta name="octolytics-dimension-repository_network_root_nwo" content="SammehFFXI/FFXIAddons" /><meta name="octolytics-dimension-repository_explore_github_marketplace_ci_cta_shown" content="false" />


    <link rel="canonical" href="https://github.com/SammehFFXI/FFXIAddons/blob/master/Sleeper/sleeper.lua" data-pjax-transient>


  <meta name="browser-stats-url" content="https://api.github.com/_private/browser/stats">

  <meta name="browser-errors-url" content="https://api.github.com/_private/browser/errors">

  <link rel="mask-icon" href="https://github.githubassets.com/pinned-octocat.svg" color="#000000">
  <link rel="alternate icon" class="js-site-favicon" type="image/png" href="https://github.githubassets.com/favicons/favicon.png">
  <link rel="icon" class="js-site-favicon" type="image/svg+xml" href="https://github.githubassets.com/favicons/favicon.svg">

<meta name="theme-color" content="#1e2327">


  <link rel="manifest" href="/manifest.json" crossOrigin="use-credentials">

  </head>

  <body class="logged-out env-production page-responsive page-blob">
    

    <div class="position-relative js-header-wrapper ">
      <a href="#start-of-content" class="px-2 py-4 bg-blue text-white show-on-focus js-skip-to-content">Skip to content</a>
      <span class="Progress progress-pjax-loader position-fixed width-full js-pjax-loader-bar">
        <span class="progress-pjax-loader-bar top-0 left-0" style="width: 0%;"></span>
      </span>

      
      



          <header class="Header-old header-logged-out js-details-container Details position-relative f4 py-2" role="banner">
  <div class="container-lg d-lg-flex flex-items-center p-responsive">
    <div class="d-flex flex-justify-between flex-items-center">
        <a class="mr-4" href="https://github.com/" aria-label="Homepage" data-ga-click="(Logged out) Header, go to homepage, icon:logo-wordmark">
          <svg height="32" class="octicon octicon-mark-github text-white" viewBox="0 0 16 16" version="1.1" width="32" aria-hidden="true"><path fill-rule="evenodd" d="M8 0C3.58 0 0 3.58 0 8c0 3.54 2.29 6.53 5.47 7.59.4.07.55-.17.55-.38 0-.19-.01-.82-.01-1.49-2.01.37-2.53-.49-2.69-.94-.09-.23-.48-.94-.82-1.13-.28-.15-.68-.52-.01-.53.63-.01 1.08.58 1.23.82.72 1.21 1.87.87 2.33.66.07-.52.28-.87.51-1.07-1.78-.2-3.64-.89-3.64-3.95 0-.87.31-1.59.82-2.15-.08-.2-.36-1.02.08-2.12 0 0 .67-.21 2.2.82.64-.18 1.32-.27 2-.27.68 0 1.36.09 2 .27 1.53-1.04 2.2-.82 2.2-.82.44 1.1.16 1.92.08 2.12.51.56.82 1.27.82 2.15 0 3.07-1.87 3.75-3.65 3.95.29.25.54.73.54 1.48 0 1.07-.01 1.93-.01 2.2 0 .21.15.46.55.38A8.013 8.013 0 0016 8c0-4.42-3.58-8-8-8z"></path></svg>
        </a>

          <div class="d-lg-none css-truncate css-truncate-target width-fit p-2">
            
                <svg class="octicon octicon-repo" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M4 9H3V8h1v1zm0-3H3v1h1V6zm0-2H3v1h1V4zm0-2H3v1h1V2zm8-1v12c0 .55-.45 1-1 1H6v2l-1.5-1.5L3 16v-2H1c-.55 0-1-.45-1-1V1c0-.55.45-1 1-1h10c.55 0 1 .45 1 1zm-1 10H1v2h2v-1h3v1h5v-2zm0-10H2v9h9V1z"></path></svg>
    <a class="Header-link" href="/SammehFFXI">SammehFFXI</a>
    /
    <a class="Header-link" href="/SammehFFXI/FFXIAddons">FFXIAddons</a>


          </div>

        <div class="d-flex flex-items-center">
            <a href="/join?source=header-repo"
              class="d-inline-block d-lg-none f5 text-white no-underline border border-gray-dark rounded-2 px-2 py-1 mr-3 mr-sm-5"
              data-hydro-click="{&quot;event_type&quot;:&quot;authentication.click&quot;,&quot;payload&quot;:{&quot;location_in_page&quot;:&quot;site header&quot;,&quot;repository_id&quot;:null,&quot;auth_type&quot;:&quot;SIGN_UP&quot;,&quot;originating_url&quot;:&quot;https://github.com/SammehFFXI/FFXIAddons/blob/master/Sleeper/sleeper.lua&quot;,&quot;user_id&quot;:null}}" data-hydro-click-hmac="3a27654c6bb13e4a64e0909122e5d637575a7972b89778567147e5ba93c6b74f"
              data-ga-click="(Logged out) Header, clicked Sign up, text:sign-up">
              Sign&nbsp;up
            </a>

          <button class="btn-link d-lg-none mt-1 js-details-target" type="button" aria-label="Toggle navigation" aria-expanded="false">
            <svg height="24" class="octicon octicon-three-bars text-white" viewBox="0 0 12 16" version="1.1" width="18" aria-hidden="true"><path fill-rule="evenodd" d="M11.41 9H.59C0 9 0 8.59 0 8c0-.59 0-1 .59-1H11.4c.59 0 .59.41.59 1 0 .59 0 1-.59 1h.01zm0-4H.59C0 5 0 4.59 0 4c0-.59 0-1 .59-1H11.4c.59 0 .59.41.59 1 0 .59 0 1-.59 1h.01zM.59 11H11.4c.59 0 .59.41.59 1 0 .59 0 1-.59 1H.59C0 13 0 12.59 0 12c0-.59 0-1 .59-1z"></path></svg>
          </button>
        </div>
    </div>

    <div class="HeaderMenu HeaderMenu--logged-out position-fixed top-0 right-0 bottom-0 height-fit position-lg-relative d-lg-flex flex-justify-between flex-items-center flex-auto">
      <div class="d-flex d-lg-none flex-justify-end border-bottom bg-gray-light p-3">
        <button class="btn-link js-details-target" type="button" aria-label="Toggle navigation" aria-expanded="false">
          <svg height="24" class="octicon octicon-x text-gray" viewBox="0 0 12 16" version="1.1" width="18" aria-hidden="true"><path fill-rule="evenodd" d="M7.48 8l3.75 3.75-1.48 1.48L6 9.48l-3.75 3.75-1.48-1.48L4.52 8 .77 4.25l1.48-1.48L6 6.52l3.75-3.75 1.48 1.48L7.48 8z"></path></svg>
        </button>
      </div>

        <nav class="mt-0 px-3 px-lg-0 mb-5 mb-lg-0" aria-label="Global">
          <ul class="d-lg-flex list-style-none">
              <li class="d-block d-lg-flex flex-lg-nowrap flex-lg-items-center border-bottom border-lg-bottom-0 mr-0 mr-lg-3 edge-item-fix position-relative flex-wrap flex-justify-between d-flex flex-items-center ">
                <details class="HeaderMenu-details details-overlay details-reset width-full">
                  <summary class="HeaderMenu-summary HeaderMenu-link px-0 py-3 border-0 no-wrap d-block d-lg-inline-block">
                    Why GitHub?
                    <svg x="0px" y="0px" viewBox="0 0 14 8" xml:space="preserve" fill="none" class="icon-chevon-down-mktg position-absolute position-lg-relative">
                      <path d="M1,1l6.2,6L13,1"></path>
                    </svg>
                  </summary>
                  <div class="dropdown-menu flex-auto rounded-1 bg-white px-0 mt-0 pb-4 p-lg-4 position-relative position-lg-absolute left-0 left-lg-n4">
                    <a href="/features" class="py-2 lh-condensed-ultra d-block link-gray-dark no-underline h5 Bump-link--hover" data-ga-click="(Logged out) Header, go to Features">Features <span class="Bump-link-symbol float-right text-normal text-gray-light">&rarr;</span></a>
                    <ul class="list-style-none f5 pb-3">
                      <li class="edge-item-fix"><a href="/features/code-review/" class="py-2 lh-condensed-ultra d-block link-gray no-underline f5" data-ga-click="(Logged out) Header, go to Code review">Code review</a></li>
                      <li class="edge-item-fix"><a href="/features/project-management/" class="py-2 lh-condensed-ultra d-block link-gray no-underline f5" data-ga-click="(Logged out) Header, go to Project management">Project management</a></li>
                      <li class="edge-item-fix"><a href="/features/integrations" class="py-2 lh-condensed-ultra d-block link-gray no-underline f5" data-ga-click="(Logged out) Header, go to Integrations">Integrations</a></li>
                      <li class="edge-item-fix"><a href="/features/actions" class="py-2 lh-condensed-ultra d-block link-gray no-underline f5" data-ga-click="(Logged out) Header, go to Actions">Actions</a></li>
                      <li class="edge-item-fix"><a href="/features/packages" class="py-2 lh-condensed-ultra d-block link-gray no-underline f5" data-ga-click="(Logged out) Header, go to GitHub Packages">Packages</a></li>
                      <li class="edge-item-fix"><a href="/features/security" class="py-2 lh-condensed-ultra d-block link-gray no-underline f5" data-ga-click="(Logged out) Header, go to Security">Security</a></li>
                      <li class="edge-item-fix"><a href="/features#team-management" class="py-2 lh-condensed-ultra d-block link-gray no-underline f5" data-ga-click="(Logged out) Header, go to Team management">Team management</a></li>
                      <li class="edge-item-fix"><a href="/features#hosting" class="py-2 lh-condensed-ultra d-block link-gray no-underline f5" data-ga-click="(Logged out) Header, go to Code hosting">Hosting</a></li>
                    </ul>

                    <ul class="list-style-none mb-0 border-lg-top pt-lg-3">
                      <li class="edge-item-fix"><a href="/customer-stories" class="py-2 lh-condensed-ultra d-block no-underline link-gray-dark no-underline h5 Bump-link--hover" data-ga-click="(Logged out) Header, go to Customer stories">Customer stories <span class="Bump-link-symbol float-right text-normal text-gray-light">&rarr;</span></a></li>
                      <li class="edge-item-fix"><a href="/security" class="py-2 lh-condensed-ultra d-block no-underline link-gray-dark no-underline h5 Bump-link--hover" data-ga-click="(Logged out) Header, go to Security">Security <span class="Bump-link-symbol float-right text-normal text-gray-light">&rarr;</span></a></li>
                    </ul>
                  </div>
                </details>
              </li>
                <li class="border-bottom border-lg-bottom-0 mr-0 mr-lg-3">
                  <a href="/team" class="HeaderMenu-link no-underline py-3 d-block d-lg-inline-block" data-ga-click="(Logged out) Header, go to Team">Team</a>
                </li>
              <li class="border-bottom border-lg-bottom-0 mr-0 mr-lg-3">
                <a href="/enterprise" class="HeaderMenu-link no-underline py-3 d-block d-lg-inline-block" data-ga-click="(Logged out) Header, go to Enterprise">Enterprise</a>
              </li>

              <li class="d-block d-lg-flex flex-lg-nowrap flex-lg-items-center border-bottom border-lg-bottom-0 mr-0 mr-lg-3 edge-item-fix position-relative flex-wrap flex-justify-between d-flex flex-items-center ">
                <details class="HeaderMenu-details details-overlay details-reset width-full">
                  <summary class="HeaderMenu-summary HeaderMenu-link px-0 py-3 border-0 no-wrap d-block d-lg-inline-block">
                    Explore
                    <svg x="0px" y="0px" viewBox="0 0 14 8" xml:space="preserve" fill="none" class="icon-chevon-down-mktg position-absolute position-lg-relative">
                      <path d="M1,1l6.2,6L13,1"></path>
                    </svg>
                  </summary>

                  <div class="dropdown-menu flex-auto rounded-1 bg-white px-0 pt-2 pb-0 mt-0 pb-4 p-lg-4 position-relative position-lg-absolute left-0 left-lg-n4">
                    <ul class="list-style-none mb-3">
                      <li class="edge-item-fix"><a href="/explore" class="py-2 lh-condensed-ultra d-block link-gray-dark no-underline h5 Bump-link--hover" data-ga-click="(Logged out) Header, go to Explore">Explore GitHub <span class="Bump-link-symbol float-right text-normal text-gray-light">&rarr;</span></a></li>
                    </ul>

                    <h4 class="text-gray-light text-normal text-mono f5 mb-2 border-lg-top pt-lg-3">Learn &amp; contribute</h4>
                    <ul class="list-style-none mb-3">
                      <li class="edge-item-fix"><a href="/topics" class="py-2 lh-condensed-ultra d-block link-gray no-underline f5" data-ga-click="(Logged out) Header, go to Topics">Topics</a></li>
                        <li class="edge-item-fix"><a href="/collections" class="py-2 lh-condensed-ultra d-block link-gray no-underline f5" data-ga-click="(Logged out) Header, go to Collections">Collections</a></li>
                      <li class="edge-item-fix"><a href="/trending" class="py-2 lh-condensed-ultra d-block link-gray no-underline f5" data-ga-click="(Logged out) Header, go to Trending">Trending</a></li>
                      <li class="edge-item-fix"><a href="https://lab.github.com/" class="py-2 lh-condensed-ultra d-block link-gray no-underline f5" data-ga-click="(Logged out) Header, go to Learning lab">Learning Lab</a></li>
                      <li class="edge-item-fix"><a href="https://opensource.guide" class="py-2 lh-condensed-ultra d-block link-gray no-underline f5" data-ga-click="(Logged out) Header, go to Open source guides">Open source guides</a></li>
                    </ul>

                    <h4 class="text-gray-light text-normal text-mono f5 mb-2 border-lg-top pt-lg-3">Connect with others</h4>
                    <ul class="list-style-none mb-0">
                      <li class="edge-item-fix"><a href="https://github.com/events" class="py-2 lh-condensed-ultra d-block link-gray no-underline f5" data-ga-click="(Logged out) Header, go to Events">Events</a></li>
                      <li class="edge-item-fix"><a href="https://github.community" class="py-2 lh-condensed-ultra d-block link-gray no-underline f5" data-ga-click="(Logged out) Header, go to Community forum">Community forum</a></li>
                      <li class="edge-item-fix"><a href="https://education.github.com" class="py-2 pb-0 lh-condensed-ultra d-block link-gray no-underline f5" data-ga-click="(Logged out) Header, go to GitHub Education">GitHub Education</a></li>
                    </ul>
                  </div>
                </details>
              </li>

              <li class="border-bottom border-lg-bottom-0 mr-0 mr-lg-3">
                <a href="/marketplace" class="HeaderMenu-link no-underline py-3 d-block d-lg-inline-block" data-ga-click="(Logged out) Header, go to Marketplace">Marketplace</a>
              </li>

              <li class="d-block d-lg-flex flex-lg-nowrap flex-lg-items-center border-bottom border-lg-bottom-0 mr-0 mr-lg-3 edge-item-fix position-relative flex-wrap flex-justify-between d-flex flex-items-center ">
                <details class="HeaderMenu-details details-overlay details-reset width-full">
                  <summary class="HeaderMenu-summary HeaderMenu-link px-0 py-3 border-0 no-wrap d-block d-lg-inline-block">
                    Pricing
                    <svg x="0px" y="0px" viewBox="0 0 14 8" xml:space="preserve" fill="none" class="icon-chevon-down-mktg position-absolute position-lg-relative">
                       <path d="M1,1l6.2,6L13,1"></path>
                    </svg>
                  </summary>

                  <div class="dropdown-menu flex-auto rounded-1 bg-white px-0 pt-2 pb-4 mt-0 p-lg-4 position-relative position-lg-absolute left-0 left-lg-n4">
                    <a href="/pricing" class="pb-2 lh-condensed-ultra d-block link-gray-dark no-underline h5 Bump-link--hover" data-ga-click="(Logged out) Header, go to Pricing">Plans <span class="Bump-link-symbol float-right text-normal text-gray-light">&rarr;</span></a>

                    <ul class="list-style-none mb-3">
                      <li class="edge-item-fix"><a href="/pricing#feature-comparison" class="py-2 lh-condensed-ultra d-block link-gray no-underline f5" data-ga-click="(Logged out) Header, go to Compare plans">Compare plans</a></li>
                      <li class="edge-item-fix"><a href="https://enterprise.github.com/contact" class="py-2 lh-condensed-ultra d-block link-gray no-underline f5" data-ga-click="(Logged out) Header, go to Contact Sales">Contact Sales</a></li>
                    </ul>

                    <ul class="list-style-none mb-0 border-lg-top pt-lg-3">
                      <li class="edge-item-fix"><a href="/nonprofit" class="py-2 lh-condensed-ultra d-block no-underline link-gray-dark no-underline h5 Bump-link--hover" data-ga-click="(Logged out) Header, go to Nonprofits">Nonprofit <span class="Bump-link-symbol float-right text-normal text-gray-light">&rarr;</span></a></li>
                      <li class="edge-item-fix"><a href="https://education.github.com" class="py-2 pb-0 lh-condensed-ultra d-block no-underline link-gray-dark no-underline h5 Bump-link--hover"  data-ga-click="(Logged out) Header, go to Education">Education <span class="Bump-link-symbol float-right text-normal text-gray-light">&rarr;</span></a></li>
                    </ul>
                  </div>
                </details>
              </li>
          </ul>
        </nav>

      <div class="d-lg-flex flex-items-center px-3 px-lg-0 text-center text-lg-left">
          <div class="d-lg-flex mb-3 mb-lg-0">
            <div class="header-search flex-self-stretch flex-lg-self-auto mr-0 mr-lg-3 mb-3 mb-lg-0 scoped-search site-scoped-search js-site-search position-relative js-jump-to"
  role="combobox"
  aria-owns="jump-to-results"
  aria-label="Search or jump to"
  aria-haspopup="listbox"
  aria-expanded="false"
>
  <div class="position-relative">
    <!-- '"` --><!-- </textarea></xmp> --></option></form><form class="js-site-search-form" role="search" aria-label="Site" data-scope-type="Repository" data-scope-id="77250642" data-scoped-search-url="/SammehFFXI/FFXIAddons/search" data-unscoped-search-url="/search" action="/SammehFFXI/FFXIAddons/search" accept-charset="UTF-8" method="get">
      <label class="form-control input-sm header-search-wrapper p-0 header-search-wrapper-jump-to position-relative d-flex flex-justify-between flex-items-center js-chromeless-input-container">
        <input type="text"
          class="form-control input-sm header-search-input jump-to-field js-jump-to-field js-site-search-focus js-site-search-field is-clearable"
          data-hotkey="s,/"
          name="q"
          value=""
          placeholder="Search"
          data-unscoped-placeholder="Search GitHub"
          data-scoped-placeholder="Search"
          autocapitalize="off"
          aria-autocomplete="list"
          aria-controls="jump-to-results"
          aria-label="Search"
          data-jump-to-suggestions-path="/_graphql/GetSuggestedNavigationDestinations"
          spellcheck="false"
          autocomplete="off"
          >
          <input type="hidden" data-csrf="true" class="js-data-jump-to-suggestions-path-csrf" value="MPZccmFNTUr9DEGp7yn4Uc8tjK7h0JiMHIo5UbZti4ADRLnIslsWpYZBsMJw8tuKeX1HeUou3Yxpqrrcn2nr2w==" />
          <input type="hidden" class="js-site-search-type-field" name="type" >
            <img src="https://github.githubassets.com/images/search-key-slash.svg" alt="" class="mr-2 header-search-key-slash">

            <div class="Box position-absolute overflow-hidden d-none jump-to-suggestions js-jump-to-suggestions-container">
              
<ul class="d-none js-jump-to-suggestions-template-container">
  

<li class="d-flex flex-justify-start flex-items-center p-0 f5 navigation-item js-navigation-item js-jump-to-suggestion" role="option">
  <a tabindex="-1" class="no-underline d-flex flex-auto flex-items-center jump-to-suggestions-path js-jump-to-suggestion-path js-navigation-open p-2" href="">
    <div class="jump-to-octicon js-jump-to-octicon flex-shrink-0 mr-2 text-center d-none">
      <svg height="16" width="16" class="octicon octicon-repo flex-shrink-0 js-jump-to-octicon-repo d-none" title="Repository" aria-label="Repository" viewBox="0 0 12 16" version="1.1" role="img"><path fill-rule="evenodd" d="M4 9H3V8h1v1zm0-3H3v1h1V6zm0-2H3v1h1V4zm0-2H3v1h1V2zm8-1v12c0 .55-.45 1-1 1H6v2l-1.5-1.5L3 16v-2H1c-.55 0-1-.45-1-1V1c0-.55.45-1 1-1h10c.55 0 1 .45 1 1zm-1 10H1v2h2v-1h3v1h5v-2zm0-10H2v9h9V1z"></path></svg>
      <svg height="16" width="16" class="octicon octicon-project flex-shrink-0 js-jump-to-octicon-project d-none" title="Project" aria-label="Project" viewBox="0 0 15 16" version="1.1" role="img"><path fill-rule="evenodd" d="M10 12h3V2h-3v10zm-4-2h3V2H6v8zm-4 4h3V2H2v12zm-1 1h13V1H1v14zM14 0H1a1 1 0 00-1 1v14a1 1 0 001 1h13a1 1 0 001-1V1a1 1 0 00-1-1z"></path></svg>
      <svg height="16" width="16" class="octicon octicon-search flex-shrink-0 js-jump-to-octicon-search d-none" title="Search" aria-label="Search" viewBox="0 0 16 16" version="1.1" role="img"><path fill-rule="evenodd" d="M15.7 13.3l-3.81-3.83A5.93 5.93 0 0013 6c0-3.31-2.69-6-6-6S1 2.69 1 6s2.69 6 6 6c1.3 0 2.48-.41 3.47-1.11l3.83 3.81c.19.2.45.3.7.3.25 0 .52-.09.7-.3a.996.996 0 000-1.41v.01zM7 10.7c-2.59 0-4.7-2.11-4.7-4.7 0-2.59 2.11-4.7 4.7-4.7 2.59 0 4.7 2.11 4.7 4.7 0 2.59-2.11 4.7-4.7 4.7z"></path></svg>
    </div>

    <img class="avatar mr-2 flex-shrink-0 js-jump-to-suggestion-avatar d-none" alt="" aria-label="Team" src="" width="28" height="28">

    <div class="jump-to-suggestion-name js-jump-to-suggestion-name flex-auto overflow-hidden text-left no-wrap css-truncate css-truncate-target">
    </div>

    <div class="border rounded-1 flex-shrink-0 bg-gray px-1 text-gray-light ml-1 f6 d-none js-jump-to-badge-search">
      <span class="js-jump-to-badge-search-text-default d-none" aria-label="in this repository">
        In this repository
      </span>
      <span class="js-jump-to-badge-search-text-global d-none" aria-label="in all of GitHub">
        All GitHub
      </span>
      <span aria-hidden="true" class="d-inline-block ml-1 v-align-middle">↵</span>
    </div>

    <div aria-hidden="true" class="border rounded-1 flex-shrink-0 bg-gray px-1 text-gray-light ml-1 f6 d-none d-on-nav-focus js-jump-to-badge-jump">
      Jump to
      <span class="d-inline-block ml-1 v-align-middle">↵</span>
    </div>
  </a>
</li>

</ul>

<ul class="d-none js-jump-to-no-results-template-container">
  <li class="d-flex flex-justify-center flex-items-center f5 d-none js-jump-to-suggestion p-2">
    <span class="text-gray">No suggested jump to results</span>
  </li>
</ul>

<ul id="jump-to-results" role="listbox" class="p-0 m-0 js-navigation-container jump-to-suggestions-results-container js-jump-to-suggestions-results-container">
  

<li class="d-flex flex-justify-start flex-items-center p-0 f5 navigation-item js-navigation-item js-jump-to-scoped-search d-none" role="option">
  <a tabindex="-1" class="no-underline d-flex flex-auto flex-items-center jump-to-suggestions-path js-jump-to-suggestion-path js-navigation-open p-2" href="">
    <div class="jump-to-octicon js-jump-to-octicon flex-shrink-0 mr-2 text-center d-none">
      <svg height="16" width="16" class="octicon octicon-repo flex-shrink-0 js-jump-to-octicon-repo d-none" title="Repository" aria-label="Repository" viewBox="0 0 12 16" version="1.1" role="img"><path fill-rule="evenodd" d="M4 9H3V8h1v1zm0-3H3v1h1V6zm0-2H3v1h1V4zm0-2H3v1h1V2zm8-1v12c0 .55-.45 1-1 1H6v2l-1.5-1.5L3 16v-2H1c-.55 0-1-.45-1-1V1c0-.55.45-1 1-1h10c.55 0 1 .45 1 1zm-1 10H1v2h2v-1h3v1h5v-2zm0-10H2v9h9V1z"></path></svg>
      <svg height="16" width="16" class="octicon octicon-project flex-shrink-0 js-jump-to-octicon-project d-none" title="Project" aria-label="Project" viewBox="0 0 15 16" version="1.1" role="img"><path fill-rule="evenodd" d="M10 12h3V2h-3v10zm-4-2h3V2H6v8zm-4 4h3V2H2v12zm-1 1h13V1H1v14zM14 0H1a1 1 0 00-1 1v14a1 1 0 001 1h13a1 1 0 001-1V1a1 1 0 00-1-1z"></path></svg>
      <svg height="16" width="16" class="octicon octicon-search flex-shrink-0 js-jump-to-octicon-search d-none" title="Search" aria-label="Search" viewBox="0 0 16 16" version="1.1" role="img"><path fill-rule="evenodd" d="M15.7 13.3l-3.81-3.83A5.93 5.93 0 0013 6c0-3.31-2.69-6-6-6S1 2.69 1 6s2.69 6 6 6c1.3 0 2.48-.41 3.47-1.11l3.83 3.81c.19.2.45.3.7.3.25 0 .52-.09.7-.3a.996.996 0 000-1.41v.01zM7 10.7c-2.59 0-4.7-2.11-4.7-4.7 0-2.59 2.11-4.7 4.7-4.7 2.59 0 4.7 2.11 4.7 4.7 0 2.59-2.11 4.7-4.7 4.7z"></path></svg>
    </div>

    <img class="avatar mr-2 flex-shrink-0 js-jump-to-suggestion-avatar d-none" alt="" aria-label="Team" src="" width="28" height="28">

    <div class="jump-to-suggestion-name js-jump-to-suggestion-name flex-auto overflow-hidden text-left no-wrap css-truncate css-truncate-target">
    </div>

    <div class="border rounded-1 flex-shrink-0 bg-gray px-1 text-gray-light ml-1 f6 d-none js-jump-to-badge-search">
      <span class="js-jump-to-badge-search-text-default d-none" aria-label="in this repository">
        In this repository
      </span>
      <span class="js-jump-to-badge-search-text-global d-none" aria-label="in all of GitHub">
        All GitHub
      </span>
      <span aria-hidden="true" class="d-inline-block ml-1 v-align-middle">↵</span>
    </div>

    <div aria-hidden="true" class="border rounded-1 flex-shrink-0 bg-gray px-1 text-gray-light ml-1 f6 d-none d-on-nav-focus js-jump-to-badge-jump">
      Jump to
      <span class="d-inline-block ml-1 v-align-middle">↵</span>
    </div>
  </a>
</li>

  

<li class="d-flex flex-justify-start flex-items-center p-0 f5 navigation-item js-navigation-item js-jump-to-global-search d-none" role="option">
  <a tabindex="-1" class="no-underline d-flex flex-auto flex-items-center jump-to-suggestions-path js-jump-to-suggestion-path js-navigation-open p-2" href="">
    <div class="jump-to-octicon js-jump-to-octicon flex-shrink-0 mr-2 text-center d-none">
      <svg height="16" width="16" class="octicon octicon-repo flex-shrink-0 js-jump-to-octicon-repo d-none" title="Repository" aria-label="Repository" viewBox="0 0 12 16" version="1.1" role="img"><path fill-rule="evenodd" d="M4 9H3V8h1v1zm0-3H3v1h1V6zm0-2H3v1h1V4zm0-2H3v1h1V2zm8-1v12c0 .55-.45 1-1 1H6v2l-1.5-1.5L3 16v-2H1c-.55 0-1-.45-1-1V1c0-.55.45-1 1-1h10c.55 0 1 .45 1 1zm-1 10H1v2h2v-1h3v1h5v-2zm0-10H2v9h9V1z"></path></svg>
      <svg height="16" width="16" class="octicon octicon-project flex-shrink-0 js-jump-to-octicon-project d-none" title="Project" aria-label="Project" viewBox="0 0 15 16" version="1.1" role="img"><path fill-rule="evenodd" d="M10 12h3V2h-3v10zm-4-2h3V2H6v8zm-4 4h3V2H2v12zm-1 1h13V1H1v14zM14 0H1a1 1 0 00-1 1v14a1 1 0 001 1h13a1 1 0 001-1V1a1 1 0 00-1-1z"></path></svg>
      <svg height="16" width="16" class="octicon octicon-search flex-shrink-0 js-jump-to-octicon-search d-none" title="Search" aria-label="Search" viewBox="0 0 16 16" version="1.1" role="img"><path fill-rule="evenodd" d="M15.7 13.3l-3.81-3.83A5.93 5.93 0 0013 6c0-3.31-2.69-6-6-6S1 2.69 1 6s2.69 6 6 6c1.3 0 2.48-.41 3.47-1.11l3.83 3.81c.19.2.45.3.7.3.25 0 .52-.09.7-.3a.996.996 0 000-1.41v.01zM7 10.7c-2.59 0-4.7-2.11-4.7-4.7 0-2.59 2.11-4.7 4.7-4.7 2.59 0 4.7 2.11 4.7 4.7 0 2.59-2.11 4.7-4.7 4.7z"></path></svg>
    </div>

    <img class="avatar mr-2 flex-shrink-0 js-jump-to-suggestion-avatar d-none" alt="" aria-label="Team" src="" width="28" height="28">

    <div class="jump-to-suggestion-name js-jump-to-suggestion-name flex-auto overflow-hidden text-left no-wrap css-truncate css-truncate-target">
    </div>

    <div class="border rounded-1 flex-shrink-0 bg-gray px-1 text-gray-light ml-1 f6 d-none js-jump-to-badge-search">
      <span class="js-jump-to-badge-search-text-default d-none" aria-label="in this repository">
        In this repository
      </span>
      <span class="js-jump-to-badge-search-text-global d-none" aria-label="in all of GitHub">
        All GitHub
      </span>
      <span aria-hidden="true" class="d-inline-block ml-1 v-align-middle">↵</span>
    </div>

    <div aria-hidden="true" class="border rounded-1 flex-shrink-0 bg-gray px-1 text-gray-light ml-1 f6 d-none d-on-nav-focus js-jump-to-badge-jump">
      Jump to
      <span class="d-inline-block ml-1 v-align-middle">↵</span>
    </div>
  </a>
</li>


</ul>

            </div>
      </label>
</form>  </div>
</div>

          </div>

        <a href="/login?return_to=%2FSammehFFXI%2FFFXIAddons%2Fblob%2Fmaster%2FSleeper%2Fsleeper.lua"
          class="HeaderMenu-link no-underline mr-3"
          data-hydro-click="{&quot;event_type&quot;:&quot;authentication.click&quot;,&quot;payload&quot;:{&quot;location_in_page&quot;:&quot;site header menu&quot;,&quot;repository_id&quot;:null,&quot;auth_type&quot;:&quot;SIGN_UP&quot;,&quot;originating_url&quot;:&quot;https://github.com/SammehFFXI/FFXIAddons/blob/master/Sleeper/sleeper.lua&quot;,&quot;user_id&quot;:null}}" data-hydro-click-hmac="6e430b63c6d2bcd36f5deb67e8f55aa23c9117ea96346f9f5d93124e87d8d0bc"
          data-ga-click="(Logged out) Header, clicked Sign in, text:sign-in">
          Sign&nbsp;in
        </a>
          <a href="/join?source=header-repo&amp;source_repo=SammehFFXI%2FFFXIAddons"
            class="HeaderMenu-link d-inline-block no-underline border border-gray-dark rounded-1 px-2 py-1"
            data-hydro-click="{&quot;event_type&quot;:&quot;authentication.click&quot;,&quot;payload&quot;:{&quot;location_in_page&quot;:&quot;site header menu&quot;,&quot;repository_id&quot;:null,&quot;auth_type&quot;:&quot;SIGN_UP&quot;,&quot;originating_url&quot;:&quot;https://github.com/SammehFFXI/FFXIAddons/blob/master/Sleeper/sleeper.lua&quot;,&quot;user_id&quot;:null}}" data-hydro-click-hmac="6e430b63c6d2bcd36f5deb67e8f55aa23c9117ea96346f9f5d93124e87d8d0bc"
            data-ga-click="(Logged out) Header, clicked Sign up, text:sign-up">
            Sign&nbsp;up
          </a>
      </div>
    </div>
  </div>
</header>

    </div>

  <div id="start-of-content" class="show-on-focus"></div>




    <div id="js-flash-container">


  <template class="js-flash-template">
    <div class="flash flash-full  js-flash-template-container">
  <div class="container-lg px-2" >
    <button class="flash-close js-flash-close" type="button" aria-label="Dismiss this message">
      <svg class="octicon octicon-x" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M7.48 8l3.75 3.75-1.48 1.48L6 9.48l-3.75 3.75-1.48-1.48L4.52 8 .77 4.25l1.48-1.48L6 6.52l3.75-3.75 1.48 1.48L7.48 8z"></path></svg>
    </button>
    
      <div class="js-flash-template-message"></div>

  </div>
</div>
  </template>
</div>


      

  <include-fragment class="js-notification-shelf-include-fragment" data-base-src="https://github.com/notifications/beta/shelf"></include-fragment>




  <div class="application-main " data-commit-hovercards-enabled>
        <div itemscope itemtype="http://schema.org/SoftwareSourceCode" class="">
    <main  >
      

  











  <div class="pagehead repohead hx_repohead readability-menu bg-gray-light pb-0 pt-0 pt-lg-3">

    <div class="d-flex container-lg mb-4 p-responsive d-none d-lg-flex">

      <div class="flex-auto min-width-0 width-fit mr-3">
        <h1 class="public  d-flex flex-wrap flex-items-center break-word float-none ">
  <span class="flex-self-stretch" style="margin-top: -2px;">
      <svg class="octicon octicon-repo" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M4 9H3V8h1v1zm0-3H3v1h1V6zm0-2H3v1h1V4zm0-2H3v1h1V2zm8-1v12c0 .55-.45 1-1 1H6v2l-1.5-1.5L3 16v-2H1c-.55 0-1-.45-1-1V1c0-.55.45-1 1-1h10c.55 0 1 .45 1 1zm-1 10H1v2h2v-1h3v1h5v-2zm0-10H2v9h9V1z"></path></svg>
  </span>
  <span class="author ml-2 flex-self-stretch" itemprop="author">
    <a class="url fn" rel="author" data-hovercard-type="user" data-hovercard-url="/users/SammehFFXI/hovercard" data-octo-click="hovercard-link-click" data-octo-dimensions="link_type:self" href="/SammehFFXI">SammehFFXI</a>
  </span>
  <span class="path-divider flex-self-stretch">/</span>
  <strong itemprop="name" class="mr-2 flex-self-stretch">
    <a data-pjax="#js-repo-pjax-container" href="/SammehFFXI/FFXIAddons">FFXIAddons</a>
  </strong>
  
</h1>


      </div>

      <ul class="pagehead-actions flex-shrink-0 " >




  <li>
    
  <a class="tooltipped tooltipped-s btn btn-sm btn-with-count" aria-label="You must be signed in to watch a repository" rel="nofollow" data-hydro-click="{&quot;event_type&quot;:&quot;authentication.click&quot;,&quot;payload&quot;:{&quot;location_in_page&quot;:&quot;notification subscription menu watch&quot;,&quot;repository_id&quot;:null,&quot;auth_type&quot;:&quot;LOG_IN&quot;,&quot;originating_url&quot;:&quot;https://github.com/SammehFFXI/FFXIAddons/blob/master/Sleeper/sleeper.lua&quot;,&quot;user_id&quot;:null}}" data-hydro-click-hmac="017ceec7e4a42063ba07b52cbde421af7ebada7c56d8e1c4f4cee31bb39ead17" href="/login?return_to=%2FSammehFFXI%2FFFXIAddons">
    <svg class="octicon octicon-eye v-align-text-bottom" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M8.06 2C3 2 0 8 0 8s3 6 8.06 6C13 14 16 8 16 8s-3-6-7.94-6zM8 12c-2.2 0-4-1.78-4-4 0-2.2 1.8-4 4-4 2.22 0 4 1.8 4 4 0 2.22-1.78 4-4 4zm2-4c0 1.11-.89 2-2 2-1.11 0-2-.89-2-2 0-1.11.89-2 2-2 1.11 0 2 .89 2 2z"></path></svg>
    Watch
</a>    <a class="social-count" href="/SammehFFXI/FFXIAddons/watchers"
       aria-label="18 users are watching this repository">
      18
    </a>

  </li>

  <li>
        <a class="btn btn-sm btn-with-count tooltipped tooltipped-s" aria-label="You must be signed in to star a repository" rel="nofollow" data-hydro-click="{&quot;event_type&quot;:&quot;authentication.click&quot;,&quot;payload&quot;:{&quot;location_in_page&quot;:&quot;star button&quot;,&quot;repository_id&quot;:77250642,&quot;auth_type&quot;:&quot;LOG_IN&quot;,&quot;originating_url&quot;:&quot;https://github.com/SammehFFXI/FFXIAddons/blob/master/Sleeper/sleeper.lua&quot;,&quot;user_id&quot;:null}}" data-hydro-click-hmac="af6bd9794977c939a1190bfa477225f567f821c7629f5de12039d77cfb4bc743" href="/login?return_to=%2FSammehFFXI%2FFFXIAddons">
      <svg height="16" class="octicon octicon-star v-align-text-bottom" vertical_align="text_bottom" viewBox="0 0 14 16" version="1.1" width="14" aria-hidden="true"><path fill-rule="evenodd" d="M14 6l-4.9-.64L7 1 4.9 5.36 0 6l3.6 3.26L2.67 14 7 11.67 11.33 14l-.93-4.74L14 6z"></path></svg>

      Star
</a>
    <a class="social-count js-social-count" href="/SammehFFXI/FFXIAddons/stargazers"
      aria-label="34 users starred this repository">
      34
    </a>

  </li>

  <li>
      <a class="btn btn-sm btn-with-count tooltipped tooltipped-s" aria-label="You must be signed in to fork a repository" rel="nofollow" data-hydro-click="{&quot;event_type&quot;:&quot;authentication.click&quot;,&quot;payload&quot;:{&quot;location_in_page&quot;:&quot;repo details fork button&quot;,&quot;repository_id&quot;:77250642,&quot;auth_type&quot;:&quot;LOG_IN&quot;,&quot;originating_url&quot;:&quot;https://github.com/SammehFFXI/FFXIAddons/blob/master/Sleeper/sleeper.lua&quot;,&quot;user_id&quot;:null}}" data-hydro-click-hmac="5ae2081071821c32adbe88abc1955550dda482ddbf67f3fb417b79bb7893651e" href="/login?return_to=%2FSammehFFXI%2FFFXIAddons">
        <svg class="octicon octicon-repo-forked v-align-text-bottom" viewBox="0 0 10 16" version="1.1" width="10" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M8 1a1.993 1.993 0 00-1 3.72V6L5 8 3 6V4.72A1.993 1.993 0 002 1a1.993 1.993 0 00-1 3.72V6.5l3 3v1.78A1.993 1.993 0 005 15a1.993 1.993 0 001-3.72V9.5l3-3V4.72A1.993 1.993 0 008 1zM2 4.2C1.34 4.2.8 3.65.8 3c0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2zm3 10c-.66 0-1.2-.55-1.2-1.2 0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2zm3-10c-.66 0-1.2-.55-1.2-1.2 0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2z"></path></svg>
        Fork
</a>
    <a href="/SammehFFXI/FFXIAddons/network/members" class="social-count"
       aria-label="78 users forked this repository">
      78
    </a>
  </li>
</ul>

    </div>
      <nav class="js-repo-nav js-sidenav-container-pjax clearfix hx_reponav reponav p-responsive d-none d-lg-block container-lg"
     itemscope
     itemtype="http://schema.org/BreadcrumbList"
    aria-label="Repository"
     data-pjax="#js-repo-pjax-container">
  <ul class="list-style-none">
    <li  itemscope itemtype="http://schema.org/ListItem" itemprop="itemListElement">
      <a class="js-selected-navigation-item selected reponav-item" itemprop="url" data-hotkey="g c" aria-current="page" data-selected-links="repo_source repo_downloads repo_commits repo_releases repo_tags repo_branches repo_packages /SammehFFXI/FFXIAddons" href="/SammehFFXI/FFXIAddons">
        <div class="d-inline"><svg class="octicon octicon-code" viewBox="0 0 14 16" version="1.1" width="14" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M9.5 3L8 4.5 11.5 8 8 11.5 9.5 13 14 8 9.5 3zm-5 0L0 8l4.5 5L6 11.5 2.5 8 6 4.5 4.5 3z"></path></svg></div>
        <span itemprop="name">Code</span>
        <meta itemprop="position" content="1">
</a>    </li>

      <li  itemscope itemtype="http://schema.org/ListItem" itemprop="itemListElement">
        <a itemprop="url" data-hotkey="g i" class="js-selected-navigation-item reponav-item" data-selected-links="repo_issues repo_labels repo_milestones /SammehFFXI/FFXIAddons/issues" href="/SammehFFXI/FFXIAddons/issues">
          <div class="d-inline"><svg class="octicon octicon-issue-opened" viewBox="0 0 14 16" version="1.1" width="14" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M7 2.3c3.14 0 5.7 2.56 5.7 5.7s-2.56 5.7-5.7 5.7A5.71 5.71 0 011.3 8c0-3.14 2.56-5.7 5.7-5.7zM7 1C3.14 1 0 4.14 0 8s3.14 7 7 7 7-3.14 7-7-3.14-7-7-7zm1 3H6v5h2V4zm0 6H6v2h2v-2z"></path></svg></div>
          <span itemprop="name">Issues</span>
          <span class="Counter">21</span>
          <meta itemprop="position" content="2">
</a>      </li>

    <li  itemscope itemtype="http://schema.org/ListItem" itemprop="itemListElement">
      <a data-hotkey="g p" data-skip-pjax="true" itemprop="url" class="js-selected-navigation-item reponav-item" data-selected-links="repo_pulls checks /SammehFFXI/FFXIAddons/pulls" href="/SammehFFXI/FFXIAddons/pulls">
        <div class="d-inline"><svg class="octicon octicon-git-pull-request" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M11 11.28V5c-.03-.78-.34-1.47-.94-2.06C9.46 2.35 8.78 2.03 8 2H7V0L4 3l3 3V4h1c.27.02.48.11.69.31.21.2.3.42.31.69v6.28A1.993 1.993 0 0010 15a1.993 1.993 0 001-3.72zm-1 2.92c-.66 0-1.2-.55-1.2-1.2 0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2zM4 3c0-1.11-.89-2-2-2a1.993 1.993 0 00-1 3.72v6.56A1.993 1.993 0 002 15a1.993 1.993 0 001-3.72V4.72c.59-.34 1-.98 1-1.72zm-.8 10c0 .66-.55 1.2-1.2 1.2-.65 0-1.2-.55-1.2-1.2 0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2zM2 4.2C1.34 4.2.8 3.65.8 3c0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2z"></path></svg></div>
        <span itemprop="name">Pull requests</span>
        <span class="Counter">1</span>
        <meta itemprop="position" content="4">
</a>    </li>


      <li itemscope itemtype="http://schema.org/ListItem" itemprop="itemListElement" class="position-relative float-left ">
        <a data-hotkey="g w" data-skip-pjax="true" class="js-selected-navigation-item reponav-item" data-selected-links="repo_actions /SammehFFXI/FFXIAddons/actions" href="/SammehFFXI/FFXIAddons/actions">
          <div class="d-inline"><svg class="octicon octicon-play" viewBox="0 0 14 16" version="1.1" width="14" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M14 8A7 7 0 110 8a7 7 0 0114 0zm-8.223 3.482l4.599-3.066a.5.5 0 000-.832L5.777 4.518A.5.5 0 005 4.934v6.132a.5.5 0 00.777.416z"></path></svg></div>
          Actions
</a>
      </li>

      <li >
        <a data-hotkey="g b" class="js-selected-navigation-item reponav-item" data-selected-links="repo_projects new_repo_project repo_project /SammehFFXI/FFXIAddons/projects" href="/SammehFFXI/FFXIAddons/projects">
          <div class="d-inline"><svg class="octicon octicon-project" viewBox="0 0 15 16" version="1.1" width="15" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M10 12h3V2h-3v10zm-4-2h3V2H6v8zm-4 4h3V2H2v12zm-1 1h13V1H1v14zM14 0H1a1 1 0 00-1 1v14a1 1 0 001 1h13a1 1 0 001-1V1a1 1 0 00-1-1z"></path></svg></div>
          Projects
          <span class="Counter">0</span>
</a>      </li>


      <li >
        <a data-skip-pjax="true" class="js-selected-navigation-item reponav-item" data-selected-links="security overview alerts policy token_scanning code_scanning /SammehFFXI/FFXIAddons/security" href="/SammehFFXI/FFXIAddons/security">
          <div class="d-inline"><svg class="octicon octicon-shield" viewBox="0 0 14 16" version="1.1" width="14" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M0 2l7-2 7 2v6.02C14 12.69 8.69 16 7 16c-1.69 0-7-3.31-7-7.98V2zm1 .75L7 1l6 1.75v5.268C13 12.104 8.449 15 7 15c-1.449 0-6-2.896-6-6.982V2.75zm1 .75L7 2v12c-1.207 0-5-2.482-5-5.985V3.5z"></path></svg></div>
          Security
              <span class="Counter js-security-tab-count" data-url="/SammehFFXI/FFXIAddons/security/overall-count" hidden></span>
</a>      </li>

      <li >
        <a class="js-selected-navigation-item reponav-item" data-selected-links="repo_graphs repo_contributors dependency_graph dependabot_updates pulse people /SammehFFXI/FFXIAddons/pulse" href="/SammehFFXI/FFXIAddons/pulse">
          <div class="d-inline"><svg class="octicon octicon-graph" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M16 14v1H0V0h1v14h15zM5 13H3V8h2v5zm4 0H7V3h2v10zm4 0h-2V6h2v7z"></path></svg></div>
          Insights
</a>      </li>


  </ul>
</nav>

  <div class="reponav-wrapper reponav-small d-lg-none">
  <nav class="reponav js-reponav text-center no-wrap"
       itemscope
       itemtype="http://schema.org/BreadcrumbList">

    <span itemscope itemtype="http://schema.org/ListItem" itemprop="itemListElement">
      <a class="js-selected-navigation-item selected reponav-item" itemprop="url" aria-current="page" data-selected-links="repo_source repo_downloads repo_commits repo_releases repo_tags repo_branches repo_packages /SammehFFXI/FFXIAddons" href="/SammehFFXI/FFXIAddons">
        <span itemprop="name">Code</span>
        <meta itemprop="position" content="1">
</a>    </span>

      <span itemscope itemtype="http://schema.org/ListItem" itemprop="itemListElement">
        <a itemprop="url" class="js-selected-navigation-item reponav-item" data-selected-links="repo_issues repo_labels repo_milestones /SammehFFXI/FFXIAddons/issues" href="/SammehFFXI/FFXIAddons/issues">
          <span itemprop="name">Issues</span>
          <span class="Counter">21</span>
          <meta itemprop="position" content="2">
</a>      </span>

    <span itemscope itemtype="http://schema.org/ListItem" itemprop="itemListElement">
      <a itemprop="url" class="js-selected-navigation-item reponav-item" data-selected-links="repo_pulls checks /SammehFFXI/FFXIAddons/pulls" href="/SammehFFXI/FFXIAddons/pulls">
        <span itemprop="name">Pull requests</span>
        <span class="Counter">1</span>
        <meta itemprop="position" content="4">
</a>    </span>


      <span itemscope itemtype="http://schema.org/ListItem" itemprop="itemListElement">
        <a itemprop="url" class="js-selected-navigation-item reponav-item" data-selected-links="repo_projects new_repo_project repo_project /SammehFFXI/FFXIAddons/projects" href="/SammehFFXI/FFXIAddons/projects">
          <span itemprop="name">Projects</span>
          <span class="Counter">0</span>
          <meta itemprop="position" content="5">
</a>      </span>

      <span itemscope itemtype="http://schema.org/ListItem" itemprop="itemListElement">
        <a itemprop="url" class="js-selected-navigation-item reponav-item" data-selected-links="repo_actions /SammehFFXI/FFXIAddons/actions" href="/SammehFFXI/FFXIAddons/actions">
          <span itemprop="name">Actions</span>
          <meta itemprop="position" content="6">
</a>      </span>


      <a itemprop="url" class="js-selected-navigation-item reponav-item" data-selected-links="security overview alerts policy token_scanning code_scanning /SammehFFXI/FFXIAddons/security" href="/SammehFFXI/FFXIAddons/security">
        <span itemprop="name">Security</span>
            <span class="Counter js-security-deferred-tab-count" hidden></span>
        <meta itemprop="position" content="8">
</a>
      <a class="js-selected-navigation-item reponav-item" data-selected-links="pulse /SammehFFXI/FFXIAddons/pulse" href="/SammehFFXI/FFXIAddons/pulse">
        Pulse
</a>

  </nav>
</div>


  </div>

  

  <include-fragment class="js-notification-shelf-include-fragment" data-base-src="https://github.com/notifications/beta/shelf"></include-fragment>


<div class="container-lg clearfix new-discussion-timeline  p-responsive">
  <div class="repository-content ">

    
    

  


    <a class="d-none js-permalink-shortcut" data-hotkey="y" href="/SammehFFXI/FFXIAddons/blob/1bbf85843fbbd39ff665ae58e4621732e7d69178/Sleeper/sleeper.lua">Permalink</a>

    <!-- blob contrib key: blob_contributors:v22:32bd1c55f95aeebb71179d2e8c154e8d -->
      <signup-prompt-controller class="signup-prompt-bg rounded-1" data-prompt="signup" hidden>
    <div class="signup-prompt p-4 text-center mb-4 rounded-1">
      <div class="position-relative">
        <button
          type="button"
          class="position-absolute top-0 right-0 btn-link link-gray"
          data-action="click:signup-prompt-controller#dismiss"
          data-ga-click="(Logged out) Sign up prompt, clicked Dismiss, text:dismiss"
        >
          Dismiss
        </button>
        <h3 class="pt-2">Join GitHub today</h3>
        <p class="col-6 mx-auto">GitHub is home to over 50 million developers working together to host and review code, manage projects, and build software together.</p>
        <a class="btn btn-primary" data-ga-click="(Logged out) Sign up prompt, clicked Sign up, text:sign-up" data-hydro-click="{&quot;event_type&quot;:&quot;authentication.click&quot;,&quot;payload&quot;:{&quot;location_in_page&quot;:&quot;files signup prompt&quot;,&quot;repository_id&quot;:null,&quot;auth_type&quot;:&quot;SIGN_UP&quot;,&quot;originating_url&quot;:&quot;https://github.com/SammehFFXI/FFXIAddons/blob/master/Sleeper/sleeper.lua&quot;,&quot;user_id&quot;:null}}" data-hydro-click-hmac="04e533e2014db1fd10d592683055da48716c646378d938050320a278f6cb390c" href="/join?source=prompt-blob-show&amp;source_repo=SammehFFXI%2FFFXIAddons">Sign up</a>
      </div>
    </div>
  </signup-prompt-controller>


    <div class="d-flex flex-items-start flex-shrink-0 flex-column flex-md-row pb-3">
      <span class="d-flex flex-justify-between width-full width-md-auto">
        
<details class="details-reset details-overlay branch-select-menu " id="branch-select-menu">
  <summary class="btn css-truncate btn-sm"
           data-hotkey="w"
           title="Switch branches or tags">
    <i>Branch:</i>
    <span class="css-truncate-target" data-menu-button>master</span>
    <span class="dropdown-caret"></span>
  </summary>

  <details-menu class="SelectMenu SelectMenu--hasFilter" src="/SammehFFXI/FFXIAddons/refs/master/Sleeper/sleeper.lua?source_action=show&amp;source_controller=blob" preload>
    <div class="SelectMenu-modal">
      <include-fragment class="SelectMenu-loading" aria-label="Menu is loading">
        <svg class="octicon octicon-octoface anim-pulse" height="32" viewBox="0 0 16 16" version="1.1" width="32" aria-hidden="true"><path fill-rule="evenodd" d="M14.7 5.34c.13-.32.55-1.59-.13-3.31 0 0-1.05-.33-3.44 1.3-1-.28-2.07-.32-3.13-.32s-2.13.04-3.13.32c-2.39-1.64-3.44-1.3-3.44-1.3-.68 1.72-.26 2.99-.13 3.31C.49 6.21 0 7.33 0 8.69 0 13.84 3.33 15 7.98 15S16 13.84 16 8.69c0-1.36-.49-2.48-1.3-3.35zM8 14.02c-3.3 0-5.98-.15-5.98-3.35 0-.76.38-1.48 1.02-2.07 1.07-.98 2.9-.46 4.96-.46 2.07 0 3.88-.52 4.96.46.65.59 1.02 1.3 1.02 2.07 0 3.19-2.68 3.35-5.98 3.35zM5.49 9.01c-.66 0-1.2.8-1.2 1.78s.54 1.79 1.2 1.79c.66 0 1.2-.8 1.2-1.79s-.54-1.78-1.2-1.78zm5.02 0c-.66 0-1.2.79-1.2 1.78s.54 1.79 1.2 1.79c.66 0 1.2-.8 1.2-1.79s-.53-1.78-1.2-1.78z"></path></svg>
      </include-fragment>
    </div>
  </details-menu>
</details>

        <div class="BtnGroup flex-shrink-0 d-md-none">
          <a href="/SammehFFXI/FFXIAddons/find/master"
                class="js-pjax-capture-input btn btn-sm BtnGroup-item"
                data-pjax
                data-hotkey="t">
            Find file
          </a>
          <clipboard-copy value="Sleeper/sleeper.lua" class="btn btn-sm BtnGroup-item">
            Copy path
          </clipboard-copy>
        </div>
      </span>
      <h2 id="blob-path" class="breadcrumb flex-auto min-width-0 text-normal flex-md-self-center ml-md-2 mr-md-3 my-2 my-md-0">
        <span class="js-repo-root text-bold"><span class="js-path-segment d-inline-block wb-break-all"><a data-pjax="true" href="/SammehFFXI/FFXIAddons"><span>FFXIAddons</span></a></span></span><span class="separator">/</span><span class="js-path-segment d-inline-block wb-break-all"><a data-pjax="true" href="/SammehFFXI/FFXIAddons/tree/master/Sleeper"><span>Sleeper</span></a></span><span class="separator">/</span><strong class="final-path">sleeper.lua</strong>
      </h2>

      <div class="BtnGroup flex-shrink-0 d-none d-md-inline-block">
        <a href="/SammehFFXI/FFXIAddons/find/master"
              class="js-pjax-capture-input btn btn-sm BtnGroup-item"
              data-pjax
              data-hotkey="t">
          Find file
        </a>
        <clipboard-copy value="Sleeper/sleeper.lua" class="btn btn-sm BtnGroup-item">
          Copy path
        </clipboard-copy>
      </div>
    </div>



    <include-fragment src="/SammehFFXI/FFXIAddons/contributors/master/Sleeper/sleeper.lua" class="Box Box--condensed commit-loader">
      <div class="Box-body bg-blue-light f6">
        Fetching contributors&hellip;
      </div>

      <div class="Box-body d-flex flex-items-center" >
        <img alt="" class="loader-loading mr-2" src="https://github.githubassets.com/images/spinners/octocat-spinner-32-EAF2F5.gif" width="16" height="16" />
        <span class="text-red h6 loader-error">Cannot retrieve contributors at this time</span>
      </div>
</include-fragment>





    <div class="Box mt-3 position-relative
      ">
      
<div class="Box-header py-2 d-flex flex-column flex-shrink-0 flex-md-row flex-md-items-center">
  <div class="text-mono f6 flex-auto pr-3 flex-order-2 flex-md-order-1 mt-2 mt-md-0">

      328 lines (270 sloc)
      <span class="file-info-divider"></span>
    12.8 KB
  </div>

  <div class="d-flex py-1 py-md-0 flex-auto flex-order-1 flex-md-order-2 flex-sm-grow-0 flex-justify-between">

    <div class="BtnGroup">
      <a id="raw-url" class="btn btn-sm BtnGroup-item" href="/SammehFFXI/FFXIAddons/raw/master/Sleeper/sleeper.lua">Raw</a>
        <a class="btn btn-sm js-update-url-with-hash BtnGroup-item" data-hotkey="b" href="/SammehFFXI/FFXIAddons/blame/master/Sleeper/sleeper.lua">Blame</a>
      <a rel="nofollow" class="btn btn-sm BtnGroup-item" href="/SammehFFXI/FFXIAddons/commits/master/Sleeper/sleeper.lua">History</a>
    </div>


    <div>
          <a class="btn-octicon tooltipped tooltipped-nw js-remove-unless-platform"
             data-platforms="windows,mac"
             href="https://desktop.github.com"
             aria-label="Open this file in GitHub Desktop"
             data-ga-click="Repository, open with desktop">
              <svg class="octicon octicon-device-desktop" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M15 2H1c-.55 0-1 .45-1 1v9c0 .55.45 1 1 1h5.34c-.25.61-.86 1.39-2.34 2h8c-1.48-.61-2.09-1.39-2.34-2H15c.55 0 1-.45 1-1V3c0-.55-.45-1-1-1zm0 9H1V3h14v8z"></path></svg>
          </a>

          <button type="button" class="btn-octicon disabled tooltipped tooltipped-nw"
            aria-label="You must be signed in to make or propose changes">
            <svg class="octicon octicon-pencil" viewBox="0 0 14 16" version="1.1" width="14" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M0 12v3h3l8-8-3-3-8 8zm3 2H1v-2h1v1h1v1zm10.3-9.3L12 6 9 3l1.3-1.3a.996.996 0 011.41 0l1.59 1.59c.39.39.39 1.02 0 1.41z"></path></svg>
          </button>
          <button type="button" class="btn-octicon btn-octicon-danger disabled tooltipped tooltipped-nw"
            aria-label="You must be signed in to make or propose changes">
            <svg class="octicon octicon-trashcan" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M11 2H9c0-.55-.45-1-1-1H5c-.55 0-1 .45-1 1H2c-.55 0-1 .45-1 1v1c0 .55.45 1 1 1v9c0 .55.45 1 1 1h7c.55 0 1-.45 1-1V5c.55 0 1-.45 1-1V3c0-.55-.45-1-1-1zm-1 12H3V5h1v8h1V5h1v8h1V5h1v8h1V5h1v9zm1-10H2V3h9v1z"></path></svg>
          </button>
    </div>
  </div>
</div>



      

  <div itemprop="text" class="Box-body p-0 blob-wrapper data type-lua ">
      
<table class="highlight tab-size js-file-line-container" data-tab-size="8" data-paste-markdown-skip>
      <tr>
        <td id="L1" class="blob-num js-line-number" data-line-number="1"></td>
        <td id="LC1" class="blob-code blob-code-inner js-file-line"><span class="pl-c"><span class="pl-c">--[[</span></span></td>
      </tr>
      <tr>
        <td id="L2" class="blob-num js-line-number" data-line-number="2"></td>
        <td id="LC2" class="blob-code blob-code-inner js-file-line"><span class="pl-c"></span></td>
      </tr>
      <tr>
        <td id="L3" class="blob-num js-line-number" data-line-number="3"></td>
        <td id="LC3" class="blob-code blob-code-inner js-file-line"><span class="pl-c">Copyright © 2017, Sammeh of Quetzalcoatl</span></td>
      </tr>
      <tr>
        <td id="L4" class="blob-num js-line-number" data-line-number="4"></td>
        <td id="LC4" class="blob-code blob-code-inner js-file-line"><span class="pl-c">All rights reserved.</span></td>
      </tr>
      <tr>
        <td id="L5" class="blob-num js-line-number" data-line-number="5"></td>
        <td id="LC5" class="blob-code blob-code-inner js-file-line"><span class="pl-c"></span></td>
      </tr>
      <tr>
        <td id="L6" class="blob-num js-line-number" data-line-number="6"></td>
        <td id="LC6" class="blob-code blob-code-inner js-file-line"><span class="pl-c">Redistribution and use in source and binary forms, with or without</span></td>
      </tr>
      <tr>
        <td id="L7" class="blob-num js-line-number" data-line-number="7"></td>
        <td id="LC7" class="blob-code blob-code-inner js-file-line"><span class="pl-c">modification, are permitted provided that the following conditions are met:</span></td>
      </tr>
      <tr>
        <td id="L8" class="blob-num js-line-number" data-line-number="8"></td>
        <td id="LC8" class="blob-code blob-code-inner js-file-line"><span class="pl-c"></span></td>
      </tr>
      <tr>
        <td id="L9" class="blob-num js-line-number" data-line-number="9"></td>
        <td id="LC9" class="blob-code blob-code-inner js-file-line"><span class="pl-c">    * Redistributions of source code must retain the above copyright</span></td>
      </tr>
      <tr>
        <td id="L10" class="blob-num js-line-number" data-line-number="10"></td>
        <td id="LC10" class="blob-code blob-code-inner js-file-line"><span class="pl-c">      notice, this list of conditions and the following disclaimer.</span></td>
      </tr>
      <tr>
        <td id="L11" class="blob-num js-line-number" data-line-number="11"></td>
        <td id="LC11" class="blob-code blob-code-inner js-file-line"><span class="pl-c">    * Redistributions in binary form must reproduce the above copyright</span></td>
      </tr>
      <tr>
        <td id="L12" class="blob-num js-line-number" data-line-number="12"></td>
        <td id="LC12" class="blob-code blob-code-inner js-file-line"><span class="pl-c">      notice, this list of conditions and the following disclaimer in the</span></td>
      </tr>
      <tr>
        <td id="L13" class="blob-num js-line-number" data-line-number="13"></td>
        <td id="LC13" class="blob-code blob-code-inner js-file-line"><span class="pl-c">      documentation and/or other materials provided with the distribution.</span></td>
      </tr>
      <tr>
        <td id="L14" class="blob-num js-line-number" data-line-number="14"></td>
        <td id="LC14" class="blob-code blob-code-inner js-file-line"><span class="pl-c">    * Neither the name of sleeper nor the</span></td>
      </tr>
      <tr>
        <td id="L15" class="blob-num js-line-number" data-line-number="15"></td>
        <td id="LC15" class="blob-code blob-code-inner js-file-line"><span class="pl-c">      names of its contributors may be used to endorse or promote products</span></td>
      </tr>
      <tr>
        <td id="L16" class="blob-num js-line-number" data-line-number="16"></td>
        <td id="LC16" class="blob-code blob-code-inner js-file-line"><span class="pl-c">      derived from this software without specific prior written permission.</span></td>
      </tr>
      <tr>
        <td id="L17" class="blob-num js-line-number" data-line-number="17"></td>
        <td id="LC17" class="blob-code blob-code-inner js-file-line"><span class="pl-c"></span></td>
      </tr>
      <tr>
        <td id="L18" class="blob-num js-line-number" data-line-number="18"></td>
        <td id="LC18" class="blob-code blob-code-inner js-file-line"><span class="pl-c">THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS &quot;AS IS&quot; AND</span></td>
      </tr>
      <tr>
        <td id="L19" class="blob-num js-line-number" data-line-number="19"></td>
        <td id="LC19" class="blob-code blob-code-inner js-file-line"><span class="pl-c">ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED</span></td>
      </tr>
      <tr>
        <td id="L20" class="blob-num js-line-number" data-line-number="20"></td>
        <td id="LC20" class="blob-code blob-code-inner js-file-line"><span class="pl-c">WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE</span></td>
      </tr>
      <tr>
        <td id="L21" class="blob-num js-line-number" data-line-number="21"></td>
        <td id="LC21" class="blob-code blob-code-inner js-file-line"><span class="pl-c">DISCLAIMED. IN NO EVENT SHALL Sammeh BE LIABLE FOR ANY</span></td>
      </tr>
      <tr>
        <td id="L22" class="blob-num js-line-number" data-line-number="22"></td>
        <td id="LC22" class="blob-code blob-code-inner js-file-line"><span class="pl-c">DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES</span></td>
      </tr>
      <tr>
        <td id="L23" class="blob-num js-line-number" data-line-number="23"></td>
        <td id="LC23" class="blob-code blob-code-inner js-file-line"><span class="pl-c">(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;</span></td>
      </tr>
      <tr>
        <td id="L24" class="blob-num js-line-number" data-line-number="24"></td>
        <td id="LC24" class="blob-code blob-code-inner js-file-line"><span class="pl-c">LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND</span></td>
      </tr>
      <tr>
        <td id="L25" class="blob-num js-line-number" data-line-number="25"></td>
        <td id="LC25" class="blob-code blob-code-inner js-file-line"><span class="pl-c">ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT</span></td>
      </tr>
      <tr>
        <td id="L26" class="blob-num js-line-number" data-line-number="26"></td>
        <td id="LC26" class="blob-code blob-code-inner js-file-line"><span class="pl-c">(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS</span></td>
      </tr>
      <tr>
        <td id="L27" class="blob-num js-line-number" data-line-number="27"></td>
        <td id="LC27" class="blob-code blob-code-inner js-file-line"><span class="pl-c">SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.</span></td>
      </tr>
      <tr>
        <td id="L28" class="blob-num js-line-number" data-line-number="28"></td>
        <td id="LC28" class="blob-code blob-code-inner js-file-line"><span class="pl-c"></span></td>
      </tr>
      <tr>
        <td id="L29" class="blob-num js-line-number" data-line-number="29"></td>
        <td id="LC29" class="blob-code blob-code-inner js-file-line"><span class="pl-c"><span class="pl-c">]]</span></span></td>
      </tr>
      <tr>
        <td id="L30" class="blob-num js-line-number" data-line-number="30"></td>
        <td id="LC30" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L31" class="blob-num js-line-number" data-line-number="31"></td>
        <td id="LC31" class="blob-code blob-code-inner js-file-line"><span class="pl-c"><span class="pl-c">--</span>Version 1.0.1 Initial Release</span></td>
      </tr>
      <tr>
        <td id="L32" class="blob-num js-line-number" data-line-number="32"></td>
        <td id="LC32" class="blob-code blob-code-inner js-file-line"><span class="pl-c"><span class="pl-c">--</span>Version 1.0.2 Fix issue with misspelling troubadour </span></td>
      </tr>
      <tr>
        <td id="L33" class="blob-num js-line-number" data-line-number="33"></td>
        <td id="LC33" class="blob-code blob-code-inner js-file-line"><span class="pl-c"><span class="pl-c">--</span>Version 1.0.3 Adding Inyanga Shalwar +2 to definitions</span></td>
      </tr>
      <tr>
        <td id="L34" class="blob-num js-line-number" data-line-number="34"></td>
        <td id="LC34" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L35" class="blob-num js-line-number" data-line-number="35"></td>
        <td id="LC35" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L36" class="blob-num js-line-number" data-line-number="36"></td>
        <td id="LC36" class="blob-code blob-code-inner js-file-line">_addon.<span class="pl-smi">name</span> <span class="pl-k">=</span> <span class="pl-s"><span class="pl-pds">&#39;</span>sleeper<span class="pl-pds">&#39;</span></span></td>
      </tr>
      <tr>
        <td id="L37" class="blob-num js-line-number" data-line-number="37"></td>
        <td id="LC37" class="blob-code blob-code-inner js-file-line">_addon.<span class="pl-smi">author</span> <span class="pl-k">=</span> <span class="pl-s"><span class="pl-pds">&#39;</span>Sammeh<span class="pl-pds">&#39;</span></span></td>
      </tr>
      <tr>
        <td id="L38" class="blob-num js-line-number" data-line-number="38"></td>
        <td id="LC38" class="blob-code blob-code-inner js-file-line">_addon.<span class="pl-smi">version</span> <span class="pl-k">=</span> <span class="pl-s"><span class="pl-pds">&#39;</span>1.0.3<span class="pl-pds">&#39;</span></span></td>
      </tr>
      <tr>
        <td id="L39" class="blob-num js-line-number" data-line-number="39"></td>
        <td id="LC39" class="blob-code blob-code-inner js-file-line">_addon.<span class="pl-smi">command</span> <span class="pl-k">=</span> <span class="pl-s"><span class="pl-pds">&#39;</span>sleeper<span class="pl-pds">&#39;</span></span></td>
      </tr>
      <tr>
        <td id="L40" class="blob-num js-line-number" data-line-number="40"></td>
        <td id="LC40" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L41" class="blob-num js-line-number" data-line-number="41"></td>
        <td id="LC41" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L42" class="blob-num js-line-number" data-line-number="42"></td>
        <td id="LC42" class="blob-code blob-code-inner js-file-line">texts <span class="pl-k">=</span> <span class="pl-c1">require</span>(<span class="pl-s"><span class="pl-pds">&#39;</span>texts<span class="pl-pds">&#39;</span></span>)</td>
      </tr>
      <tr>
        <td id="L43" class="blob-num js-line-number" data-line-number="43"></td>
        <td id="LC43" class="blob-code blob-code-inner js-file-line">res <span class="pl-k">=</span> <span class="pl-c1">require</span> <span class="pl-s"><span class="pl-pds">&#39;</span>resources<span class="pl-pds">&#39;</span></span></td>
      </tr>
      <tr>
        <td id="L44" class="blob-num js-line-number" data-line-number="44"></td>
        <td id="LC44" class="blob-code blob-code-inner js-file-line">packets <span class="pl-k">=</span> <span class="pl-c1">require</span>(<span class="pl-s"><span class="pl-pds">&#39;</span>packets<span class="pl-pds">&#39;</span></span>)</td>
      </tr>
      <tr>
        <td id="L45" class="blob-num js-line-number" data-line-number="45"></td>
        <td id="LC45" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L46" class="blob-num js-line-number" data-line-number="46"></td>
        <td id="LC46" class="blob-code blob-code-inner js-file-line">debuff_txt <span class="pl-k">=</span> {}</td>
      </tr>
      <tr>
        <td id="L47" class="blob-num js-line-number" data-line-number="47"></td>
        <td id="LC47" class="blob-code blob-code-inner js-file-line">debuff_txt.<span class="pl-smi">pos</span> <span class="pl-k">=</span> {}</td>
      </tr>
      <tr>
        <td id="L48" class="blob-num js-line-number" data-line-number="48"></td>
        <td id="LC48" class="blob-code blob-code-inner js-file-line">debuff_txt.<span class="pl-smi">pos</span>.<span class="pl-smi">x</span> <span class="pl-k">=</span> <span class="pl-k">-</span><span class="pl-c1">180</span></td>
      </tr>
      <tr>
        <td id="L49" class="blob-num js-line-number" data-line-number="49"></td>
        <td id="LC49" class="blob-code blob-code-inner js-file-line">debuff_txt.<span class="pl-smi">pos</span>.<span class="pl-smi">y</span> <span class="pl-k">=</span> <span class="pl-c1">85</span></td>
      </tr>
      <tr>
        <td id="L50" class="blob-num js-line-number" data-line-number="50"></td>
        <td id="LC50" class="blob-code blob-code-inner js-file-line">debuff_txt.<span class="pl-smi">text</span> <span class="pl-k">=</span> {}</td>
      </tr>
      <tr>
        <td id="L51" class="blob-num js-line-number" data-line-number="51"></td>
        <td id="LC51" class="blob-code blob-code-inner js-file-line">debuff_txt.<span class="pl-smi">text</span>.<span class="pl-smi">font</span> <span class="pl-k">=</span> <span class="pl-s"><span class="pl-pds">&#39;</span>Arial<span class="pl-pds">&#39;</span></span></td>
      </tr>
      <tr>
        <td id="L52" class="blob-num js-line-number" data-line-number="52"></td>
        <td id="LC52" class="blob-code blob-code-inner js-file-line">debuff_txt.<span class="pl-smi">text</span>.<span class="pl-smi">size</span> <span class="pl-k">=</span> <span class="pl-c1">10</span></td>
      </tr>
      <tr>
        <td id="L53" class="blob-num js-line-number" data-line-number="53"></td>
        <td id="LC53" class="blob-code blob-code-inner js-file-line">debuff_txt.<span class="pl-smi">flags</span> <span class="pl-k">=</span> {}</td>
      </tr>
      <tr>
        <td id="L54" class="blob-num js-line-number" data-line-number="54"></td>
        <td id="LC54" class="blob-code blob-code-inner js-file-line">debuff_txt.<span class="pl-smi">flags</span>.<span class="pl-smi">right</span> <span class="pl-k">=</span> <span class="pl-c1">true</span></td>
      </tr>
      <tr>
        <td id="L55" class="blob-num js-line-number" data-line-number="55"></td>
        <td id="LC55" class="blob-code blob-code-inner js-file-line">debuff_box <span class="pl-k">=</span> texts.<span class="pl-c1">new</span>(<span class="pl-s"><span class="pl-pds">&#39;</span>${value}<span class="pl-pds">&#39;</span></span>, debuff_txt)</td>
      </tr>
      <tr>
        <td id="L56" class="blob-num js-line-number" data-line-number="56"></td>
        <td id="LC56" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L57" class="blob-num js-line-number" data-line-number="57"></td>
        <td id="LC57" class="blob-code blob-code-inner js-file-line"><span class="pl-k">local</span> monster_list <span class="pl-k">=</span> {}</td>
      </tr>
      <tr>
        <td id="L58" class="blob-num js-line-number" data-line-number="58"></td>
        <td id="LC58" class="blob-code blob-code-inner js-file-line"><span class="pl-k">local</span> boxvisible <span class="pl-k">=</span> <span class="pl-c1">false</span></td>
      </tr>
      <tr>
        <td id="L59" class="blob-num js-line-number" data-line-number="59"></td>
        <td id="LC59" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L60" class="blob-num js-line-number" data-line-number="60"></td>
        <td id="LC60" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L61" class="blob-num js-line-number" data-line-number="61"></td>
        <td id="LC61" class="blob-code blob-code-inner js-file-line">windower.<span class="pl-c1">register_event</span>(<span class="pl-s"><span class="pl-pds">&#39;</span>addon command<span class="pl-pds">&#39;</span></span>, <span class="pl-k">function</span>(<span class="pl-smi">command</span>)</td>
      </tr>
      <tr>
        <td id="L62" class="blob-num js-line-number" data-line-number="62"></td>
        <td id="LC62" class="blob-code blob-code-inner js-file-line">	<span class="pl-k">if</span> command <span class="pl-k">==</span> <span class="pl-s"><span class="pl-pds">&#39;</span>reset<span class="pl-pds">&#39;</span></span> <span class="pl-k">then</span> <span class="pl-c1">reset_list</span>() <span class="pl-k">end</span></td>
      </tr>
      <tr>
        <td id="L63" class="blob-num js-line-number" data-line-number="63"></td>
        <td id="LC63" class="blob-code blob-code-inner js-file-line">	<span class="pl-k">if</span> command <span class="pl-k">==</span> <span class="pl-s"><span class="pl-pds">&#39;</span>show<span class="pl-pds">&#39;</span></span> <span class="pl-k">then</span> boxvisible <span class="pl-k">=</span> <span class="pl-c1">true</span> <span class="pl-k">end</span></td>
      </tr>
      <tr>
        <td id="L64" class="blob-num js-line-number" data-line-number="64"></td>
        <td id="LC64" class="blob-code blob-code-inner js-file-line">	<span class="pl-k">if</span> command <span class="pl-k">==</span> <span class="pl-s"><span class="pl-pds">&#39;</span>hide<span class="pl-pds">&#39;</span></span> <span class="pl-k">then</span> boxvisible <span class="pl-k">=</span> <span class="pl-c1">false</span> <span class="pl-k">end</span> </td>
      </tr>
      <tr>
        <td id="L65" class="blob-num js-line-number" data-line-number="65"></td>
        <td id="LC65" class="blob-code blob-code-inner js-file-line"><span class="pl-k">end</span>)</td>
      </tr>
      <tr>
        <td id="L66" class="blob-num js-line-number" data-line-number="66"></td>
        <td id="LC66" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L67" class="blob-num js-line-number" data-line-number="67"></td>
        <td id="LC67" class="blob-code blob-code-inner js-file-line"><span class="pl-k">function</span> <span class="pl-en">reset_list</span>()</td>
      </tr>
      <tr>
        <td id="L68" class="blob-num js-line-number" data-line-number="68"></td>
        <td id="LC68" class="blob-code blob-code-inner js-file-line">	<span class="pl-k">for</span> i,v <span class="pl-k">in</span> <span class="pl-c1">pairs</span>(monster_list) <span class="pl-k">do</span></td>
      </tr>
      <tr>
        <td id="L69" class="blob-num js-line-number" data-line-number="69"></td>
        <td id="LC69" class="blob-code blob-code-inner js-file-line">		monster_list[i] <span class="pl-k">=</span> <span class="pl-c1">nil</span></td>
      </tr>
      <tr>
        <td id="L70" class="blob-num js-line-number" data-line-number="70"></td>
        <td id="LC70" class="blob-code blob-code-inner js-file-line">	<span class="pl-k">end</span></td>
      </tr>
      <tr>
        <td id="L71" class="blob-num js-line-number" data-line-number="71"></td>
        <td id="LC71" class="blob-code blob-code-inner js-file-line"><span class="pl-k">end</span></td>
      </tr>
      <tr>
        <td id="L72" class="blob-num js-line-number" data-line-number="72"></td>
        <td id="LC72" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L73" class="blob-num js-line-number" data-line-number="73"></td>
        <td id="LC73" class="blob-code blob-code-inner js-file-line"><span class="pl-k">function</span> <span class="pl-en">new_sleep</span>(<span class="pl-smi">target</span>, <span class="pl-smi">duration</span>)</td>
      </tr>
      <tr>
        <td id="L74" class="blob-num js-line-number" data-line-number="74"></td>
        <td id="LC74" class="blob-code blob-code-inner js-file-line">	<span class="pl-k">local</span> mob <span class="pl-k">=</span> windower.<span class="pl-smi">ffxi</span>.<span class="pl-c1">get_mob_by_id</span>(target)</td>
      </tr>
      <tr>
        <td id="L75" class="blob-num js-line-number" data-line-number="75"></td>
        <td id="LC75" class="blob-code blob-code-inner js-file-line">	monster_list[target] <span class="pl-k">=</span> {start<span class="pl-k">=</span><span class="pl-c1">os.clock</span>(),debuff_duration<span class="pl-k">=</span>duration,x<span class="pl-k">=</span>mob.<span class="pl-smi">x</span>,y<span class="pl-k">=</span>mob.<span class="pl-smi">y</span>,z<span class="pl-k">=</span>mob.<span class="pl-smi">z</span>}</td>
      </tr>
      <tr>
        <td id="L76" class="blob-num js-line-number" data-line-number="76"></td>
        <td id="LC76" class="blob-code blob-code-inner js-file-line"><span class="pl-k">end</span></td>
      </tr>
      <tr>
        <td id="L77" class="blob-num js-line-number" data-line-number="77"></td>
        <td id="LC77" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L78" class="blob-num js-line-number" data-line-number="78"></td>
        <td id="LC78" class="blob-code blob-code-inner js-file-line"><span class="pl-k">function</span> <span class="pl-en">count_monster_list</span>()</td>
      </tr>
      <tr>
        <td id="L79" class="blob-num js-line-number" data-line-number="79"></td>
        <td id="LC79" class="blob-code blob-code-inner js-file-line">	<span class="pl-k">local</span> num <span class="pl-k">=</span> <span class="pl-c1">0</span></td>
      </tr>
      <tr>
        <td id="L80" class="blob-num js-line-number" data-line-number="80"></td>
        <td id="LC80" class="blob-code blob-code-inner js-file-line">		<span class="pl-k">for</span> i,v <span class="pl-k">in</span> <span class="pl-c1">pairs</span>(monster_list) <span class="pl-k">do</span></td>
      </tr>
      <tr>
        <td id="L81" class="blob-num js-line-number" data-line-number="81"></td>
        <td id="LC81" class="blob-code blob-code-inner js-file-line">			num <span class="pl-k">=</span> num <span class="pl-k">+</span><span class="pl-c1">1</span></td>
      </tr>
      <tr>
        <td id="L82" class="blob-num js-line-number" data-line-number="82"></td>
        <td id="LC82" class="blob-code blob-code-inner js-file-line">		<span class="pl-k">end</span></td>
      </tr>
      <tr>
        <td id="L83" class="blob-num js-line-number" data-line-number="83"></td>
        <td id="LC83" class="blob-code blob-code-inner js-file-line">	<span class="pl-k">return</span> num</td>
      </tr>
      <tr>
        <td id="L84" class="blob-num js-line-number" data-line-number="84"></td>
        <td id="LC84" class="blob-code blob-code-inner js-file-line"><span class="pl-k">end</span></td>
      </tr>
      <tr>
        <td id="L85" class="blob-num js-line-number" data-line-number="85"></td>
        <td id="LC85" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L86" class="blob-num js-line-number" data-line-number="86"></td>
        <td id="LC86" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L87" class="blob-num js-line-number" data-line-number="87"></td>
        <td id="LC87" class="blob-code blob-code-inner js-file-line">windower.<span class="pl-c1">register_event</span>(<span class="pl-s"><span class="pl-pds">&#39;</span>prerender<span class="pl-pds">&#39;</span></span>, <span class="pl-k">function</span>()</td>
      </tr>
      <tr>
        <td id="L88" class="blob-num js-line-number" data-line-number="88"></td>
        <td id="LC88" class="blob-code blob-code-inner js-file-line">	<span class="pl-k">local</span> t <span class="pl-k">=</span> windower.<span class="pl-smi">ffxi</span>.<span class="pl-c1">get_mob_by_index</span>(windower.<span class="pl-smi">ffxi</span>.<span class="pl-c1">get_player</span>().<span class="pl-smi">target_index</span> <span class="pl-k">or</span> <span class="pl-c1">0</span>)</td>
      </tr>
      <tr>
        <td id="L89" class="blob-num js-line-number" data-line-number="89"></td>
        <td id="LC89" class="blob-code blob-code-inner js-file-line">	<span class="pl-k">local</span> mob_id,value</td>
      </tr>
      <tr>
        <td id="L90" class="blob-num js-line-number" data-line-number="90"></td>
        <td id="LC90" class="blob-code blob-code-inner js-file-line">	<span class="pl-k">if</span> monster_list <span class="pl-k">and</span> <span class="pl-c1">count_monster_list</span>() <span class="pl-k">&gt;</span> <span class="pl-c1">0</span> <span class="pl-k">then</span> </td>
      </tr>
      <tr>
        <td id="L91" class="blob-num js-line-number" data-line-number="91"></td>
        <td id="LC91" class="blob-code blob-code-inner js-file-line">		<span class="pl-k">local</span> debuff_txtbox <span class="pl-k">=</span> <span class="pl-s"><span class="pl-pds">&#39;</span>Target List: <span class="pl-pds">&#39;</span></span><span class="pl-k">..</span><span class="pl-c1">count_monster_list</span>()</td>
      </tr>
      <tr>
        <td id="L92" class="blob-num js-line-number" data-line-number="92"></td>
        <td id="LC92" class="blob-code blob-code-inner js-file-line">		<span class="pl-k">for</span> mob_id,value <span class="pl-k">in</span> <span class="pl-c1">pairs</span>(monster_list) <span class="pl-k">do</span></td>
      </tr>
      <tr>
        <td id="L93" class="blob-num js-line-number" data-line-number="93"></td>
        <td id="LC93" class="blob-code blob-code-inner js-file-line">			<span class="pl-k">local</span> mob <span class="pl-k">=</span> windower.<span class="pl-smi">ffxi</span>.<span class="pl-c1">get_mob_by_id</span>(mob_id)</td>
      </tr>
      <tr>
        <td id="L94" class="blob-num js-line-number" data-line-number="94"></td>
        <td id="LC94" class="blob-code blob-code-inner js-file-line">			</td>
      </tr>
      <tr>
        <td id="L95" class="blob-num js-line-number" data-line-number="95"></td>
        <td id="LC95" class="blob-code blob-code-inner js-file-line">			<span class="pl-k">if</span> mob <span class="pl-k">then</span> </td>
      </tr>
      <tr>
        <td id="L96" class="blob-num js-line-number" data-line-number="96"></td>
        <td id="LC96" class="blob-code blob-code-inner js-file-line">			</td>
      </tr>
      <tr>
        <td id="L97" class="blob-num js-line-number" data-line-number="97"></td>
        <td id="LC97" class="blob-code blob-code-inner js-file-line">			<span class="pl-k">if</span> mob.<span class="pl-smi">x</span> <span class="pl-k">and</span> value.<span class="pl-smi">x</span> <span class="pl-k">then</span> </td>
      </tr>
      <tr>
        <td id="L98" class="blob-num js-line-number" data-line-number="98"></td>
        <td id="LC98" class="blob-code blob-code-inner js-file-line">				x_delta <span class="pl-k">=</span> mob.<span class="pl-smi">x</span> <span class="pl-k">-</span> value.<span class="pl-smi">x</span></td>
      </tr>
      <tr>
        <td id="L99" class="blob-num js-line-number" data-line-number="99"></td>
        <td id="LC99" class="blob-code blob-code-inner js-file-line">			<span class="pl-k">else</span></td>
      </tr>
      <tr>
        <td id="L100" class="blob-num js-line-number" data-line-number="100"></td>
        <td id="LC100" class="blob-code blob-code-inner js-file-line">				x_delta <span class="pl-k">=</span> <span class="pl-c1">0</span></td>
      </tr>
      <tr>
        <td id="L101" class="blob-num js-line-number" data-line-number="101"></td>
        <td id="LC101" class="blob-code blob-code-inner js-file-line">			<span class="pl-k">end</span></td>
      </tr>
      <tr>
        <td id="L102" class="blob-num js-line-number" data-line-number="102"></td>
        <td id="LC102" class="blob-code blob-code-inner js-file-line">			<span class="pl-k">if</span> mob.<span class="pl-smi">y</span> <span class="pl-k">and</span> value.<span class="pl-smi">y</span> <span class="pl-k">then</span> </td>
      </tr>
      <tr>
        <td id="L103" class="blob-num js-line-number" data-line-number="103"></td>
        <td id="LC103" class="blob-code blob-code-inner js-file-line">				y_delta <span class="pl-k">=</span> mob.<span class="pl-smi">y</span> <span class="pl-k">-</span> value.<span class="pl-smi">y</span></td>
      </tr>
      <tr>
        <td id="L104" class="blob-num js-line-number" data-line-number="104"></td>
        <td id="LC104" class="blob-code blob-code-inner js-file-line">			<span class="pl-k">else</span></td>
      </tr>
      <tr>
        <td id="L105" class="blob-num js-line-number" data-line-number="105"></td>
        <td id="LC105" class="blob-code blob-code-inner js-file-line">				y_delta <span class="pl-k">=</span> <span class="pl-c1">0</span></td>
      </tr>
      <tr>
        <td id="L106" class="blob-num js-line-number" data-line-number="106"></td>
        <td id="LC106" class="blob-code blob-code-inner js-file-line">			<span class="pl-k">end</span></td>
      </tr>
      <tr>
        <td id="L107" class="blob-num js-line-number" data-line-number="107"></td>
        <td id="LC107" class="blob-code blob-code-inner js-file-line">			</td>
      </tr>
      <tr>
        <td id="L108" class="blob-num js-line-number" data-line-number="108"></td>
        <td id="LC108" class="blob-code blob-code-inner js-file-line">			</td>
      </tr>
      <tr>
        <td id="L109" class="blob-num js-line-number" data-line-number="109"></td>
        <td id="LC109" class="blob-code blob-code-inner js-file-line">			<span class="pl-k">if</span> x_delta <span class="pl-k">&gt;</span> <span class="pl-c1">5</span> <span class="pl-k">or</span> x_delta <span class="pl-k">&lt;</span> <span class="pl-k">-</span><span class="pl-c1">5</span> <span class="pl-k">or</span> y_delta <span class="pl-k">&gt;</span> <span class="pl-c1">5</span> <span class="pl-k">or</span> y_delta <span class="pl-k">&lt;</span> <span class="pl-k">-</span><span class="pl-c1">5</span> <span class="pl-k">then</span> </td>
      </tr>
      <tr>
        <td id="L110" class="blob-num js-line-number" data-line-number="110"></td>
        <td id="LC110" class="blob-code blob-code-inner js-file-line">				monster_list[mob_id].<span class="pl-smi">debuff_duration</span> <span class="pl-k">=</span> <span class="pl-c1">0</span></td>
      </tr>
      <tr>
        <td id="L111" class="blob-num js-line-number" data-line-number="111"></td>
        <td id="LC111" class="blob-code blob-code-inner js-file-line">			<span class="pl-k">end</span></td>
      </tr>
      <tr>
        <td id="L112" class="blob-num js-line-number" data-line-number="112"></td>
        <td id="LC112" class="blob-code blob-code-inner js-file-line">			</td>
      </tr>
      <tr>
        <td id="L113" class="blob-num js-line-number" data-line-number="113"></td>
        <td id="LC113" class="blob-code blob-code-inner js-file-line">			<span class="pl-k">local</span> start_time <span class="pl-k">=</span> monster_list[mob_id].<span class="pl-smi">start</span></td>
      </tr>
      <tr>
        <td id="L114" class="blob-num js-line-number" data-line-number="114"></td>
        <td id="LC114" class="blob-code blob-code-inner js-file-line">			<span class="pl-k">local</span> duration <span class="pl-k">=</span> monster_list[mob_id].<span class="pl-smi">debuff_duration</span></td>
      </tr>
      <tr>
        <td id="L115" class="blob-num js-line-number" data-line-number="115"></td>
        <td id="LC115" class="blob-code blob-code-inner js-file-line">			<span class="pl-k">local</span> now <span class="pl-k">=</span> <span class="pl-c1">os.clock</span>()	</td>
      </tr>
      <tr>
        <td id="L116" class="blob-num js-line-number" data-line-number="116"></td>
        <td id="LC116" class="blob-code blob-code-inner js-file-line">			<span class="pl-k">local</span> remaining_time <span class="pl-k">=</span> <span class="pl-c1">string.format</span>(<span class="pl-s"><span class="pl-pds">&quot;</span>%.1f<span class="pl-pds">&quot;</span></span>, duration <span class="pl-k">-</span> (now <span class="pl-k">-</span> start_time))</td>
      </tr>
      <tr>
        <td id="L117" class="blob-num js-line-number" data-line-number="117"></td>
        <td id="LC117" class="blob-code blob-code-inner js-file-line">			</td>
      </tr>
      <tr>
        <td id="L118" class="blob-num js-line-number" data-line-number="118"></td>
        <td id="LC118" class="blob-code blob-code-inner js-file-line">			<span class="pl-k">if</span> mob.<span class="pl-smi">status</span> <span class="pl-k">==</span> <span class="pl-c1">1</span> <span class="pl-k">or</span> mob.<span class="pl-smi">status</span> <span class="pl-k">==</span> <span class="pl-c1">0</span> <span class="pl-k">then</span> </td>
      </tr>
      <tr>
        <td id="L119" class="blob-num js-line-number" data-line-number="119"></td>
        <td id="LC119" class="blob-code blob-code-inner js-file-line">				<span class="pl-k">if</span> t <span class="pl-k">then</span></td>
      </tr>
      <tr>
        <td id="L120" class="blob-num js-line-number" data-line-number="120"></td>
        <td id="LC120" class="blob-code blob-code-inner js-file-line">					<span class="pl-k">if</span> t.<span class="pl-smi">id</span> <span class="pl-k">==</span> mob_id <span class="pl-k">then</span> </td>
      </tr>
      <tr>
        <td id="L121" class="blob-num js-line-number" data-line-number="121"></td>
        <td id="LC121" class="blob-code blob-code-inner js-file-line">						<span class="pl-c"><span class="pl-c">--</span> Print the txt in Green!</span></td>
      </tr>
      <tr>
        <td id="L122" class="blob-num js-line-number" data-line-number="122"></td>
        <td id="LC122" class="blob-code blob-code-inner js-file-line">						<span class="pl-k">if</span> duration <span class="pl-k">-</span> (now <span class="pl-k">-</span> start_time) <span class="pl-k">&lt;</span> <span class="pl-c1">0</span> <span class="pl-k">then</span> </td>
      </tr>
      <tr>
        <td id="L123" class="blob-num js-line-number" data-line-number="123"></td>
        <td id="LC123" class="blob-code blob-code-inner js-file-line">							debuff_txtbox <span class="pl-k">=</span> debuff_txtbox<span class="pl-k">..</span><span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-cce">\n\\</span>cs(0,255,0)Mob: <span class="pl-pds">&quot;</span></span><span class="pl-k">..</span>mob.<span class="pl-smi">name</span><span class="pl-k">..</span><span class="pl-s"><span class="pl-pds">&quot;</span> Awake!<span class="pl-cce">\\</span>cs(255,255,255)<span class="pl-pds">&quot;</span></span> </td>
      </tr>
      <tr>
        <td id="L124" class="blob-num js-line-number" data-line-number="124"></td>
        <td id="LC124" class="blob-code blob-code-inner js-file-line">						<span class="pl-k">else</span></td>
      </tr>
      <tr>
        <td id="L125" class="blob-num js-line-number" data-line-number="125"></td>
        <td id="LC125" class="blob-code blob-code-inner js-file-line">							debuff_txtbox <span class="pl-k">=</span> debuff_txtbox<span class="pl-k">..</span><span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-cce">\n\\</span>cs(0,255,0)Mob: <span class="pl-pds">&quot;</span></span><span class="pl-k">..</span>mob.<span class="pl-smi">name</span><span class="pl-k">..</span><span class="pl-s"><span class="pl-pds">&quot;</span> Is Asleep! Remaining:<span class="pl-pds">&quot;</span></span><span class="pl-k">..</span>remaining_time<span class="pl-k">..</span><span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-cce">\\</span>cs(255,255,255)<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L126" class="blob-num js-line-number" data-line-number="126"></td>
        <td id="LC126" class="blob-code blob-code-inner js-file-line">						<span class="pl-k">end</span></td>
      </tr>
      <tr>
        <td id="L127" class="blob-num js-line-number" data-line-number="127"></td>
        <td id="LC127" class="blob-code blob-code-inner js-file-line">					<span class="pl-k">else</span></td>
      </tr>
      <tr>
        <td id="L128" class="blob-num js-line-number" data-line-number="128"></td>
        <td id="LC128" class="blob-code blob-code-inner js-file-line">						<span class="pl-k">if</span> duration <span class="pl-k">-</span> (now <span class="pl-k">-</span> start_time) <span class="pl-k">&lt;</span> <span class="pl-c1">0</span> <span class="pl-k">then</span> </td>
      </tr>
      <tr>
        <td id="L129" class="blob-num js-line-number" data-line-number="129"></td>
        <td id="LC129" class="blob-code blob-code-inner js-file-line">							debuff_txtbox <span class="pl-k">=</span> debuff_txtbox<span class="pl-k">..</span><span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-cce">\n</span>Mob: <span class="pl-pds">&quot;</span></span><span class="pl-k">..</span>mob.<span class="pl-smi">name</span><span class="pl-k">..</span><span class="pl-s"><span class="pl-pds">&quot;</span> Awake!<span class="pl-pds">&quot;</span></span> </td>
      </tr>
      <tr>
        <td id="L130" class="blob-num js-line-number" data-line-number="130"></td>
        <td id="LC130" class="blob-code blob-code-inner js-file-line">						<span class="pl-k">else</span></td>
      </tr>
      <tr>
        <td id="L131" class="blob-num js-line-number" data-line-number="131"></td>
        <td id="LC131" class="blob-code blob-code-inner js-file-line">							debuff_txtbox <span class="pl-k">=</span> debuff_txtbox<span class="pl-k">..</span><span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-cce">\n</span>Mob: <span class="pl-pds">&quot;</span></span><span class="pl-k">..</span>mob.<span class="pl-smi">name</span><span class="pl-k">..</span><span class="pl-s"><span class="pl-pds">&quot;</span> Is Asleep! Remaining:<span class="pl-pds">&quot;</span></span><span class="pl-k">..</span>remaining_time	</td>
      </tr>
      <tr>
        <td id="L132" class="blob-num js-line-number" data-line-number="132"></td>
        <td id="LC132" class="blob-code blob-code-inner js-file-line">						<span class="pl-k">end</span></td>
      </tr>
      <tr>
        <td id="L133" class="blob-num js-line-number" data-line-number="133"></td>
        <td id="LC133" class="blob-code blob-code-inner js-file-line">					<span class="pl-k">end</span></td>
      </tr>
      <tr>
        <td id="L134" class="blob-num js-line-number" data-line-number="134"></td>
        <td id="LC134" class="blob-code blob-code-inner js-file-line">				<span class="pl-k">else</span></td>
      </tr>
      <tr>
        <td id="L135" class="blob-num js-line-number" data-line-number="135"></td>
        <td id="LC135" class="blob-code blob-code-inner js-file-line">					<span class="pl-k">if</span> duration <span class="pl-k">-</span> (now <span class="pl-k">-</span> start_time) <span class="pl-k">&lt;</span> <span class="pl-c1">0</span> <span class="pl-k">then</span> </td>
      </tr>
      <tr>
        <td id="L136" class="blob-num js-line-number" data-line-number="136"></td>
        <td id="LC136" class="blob-code blob-code-inner js-file-line">						debuff_txtbox <span class="pl-k">=</span> debuff_txtbox<span class="pl-k">..</span><span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-cce">\n</span>Mob: <span class="pl-pds">&quot;</span></span><span class="pl-k">..</span>mob.<span class="pl-smi">name</span><span class="pl-k">..</span><span class="pl-s"><span class="pl-pds">&quot;</span> Awake!<span class="pl-pds">&quot;</span></span> </td>
      </tr>
      <tr>
        <td id="L137" class="blob-num js-line-number" data-line-number="137"></td>
        <td id="LC137" class="blob-code blob-code-inner js-file-line">					<span class="pl-k">else</span></td>
      </tr>
      <tr>
        <td id="L138" class="blob-num js-line-number" data-line-number="138"></td>
        <td id="LC138" class="blob-code blob-code-inner js-file-line">						debuff_txtbox <span class="pl-k">=</span> debuff_txtbox<span class="pl-k">..</span><span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-cce">\n</span>Mob: <span class="pl-pds">&quot;</span></span><span class="pl-k">..</span>mob.<span class="pl-smi">name</span><span class="pl-k">..</span><span class="pl-s"><span class="pl-pds">&quot;</span> Is Asleep! Remaining:<span class="pl-pds">&quot;</span></span><span class="pl-k">..</span>remaining_time	</td>
      </tr>
      <tr>
        <td id="L139" class="blob-num js-line-number" data-line-number="139"></td>
        <td id="LC139" class="blob-code blob-code-inner js-file-line">					<span class="pl-k">end</span></td>
      </tr>
      <tr>
        <td id="L140" class="blob-num js-line-number" data-line-number="140"></td>
        <td id="LC140" class="blob-code blob-code-inner js-file-line">				<span class="pl-k">end</span></td>
      </tr>
      <tr>
        <td id="L141" class="blob-num js-line-number" data-line-number="141"></td>
        <td id="LC141" class="blob-code blob-code-inner js-file-line">			<span class="pl-k">else</span></td>
      </tr>
      <tr>
        <td id="L142" class="blob-num js-line-number" data-line-number="142"></td>
        <td id="LC142" class="blob-code blob-code-inner js-file-line">				monster_list[mob_id] <span class="pl-k">=</span> <span class="pl-c1">nil</span></td>
      </tr>
      <tr>
        <td id="L143" class="blob-num js-line-number" data-line-number="143"></td>
        <td id="LC143" class="blob-code blob-code-inner js-file-line">			<span class="pl-k">end</span></td>
      </tr>
      <tr>
        <td id="L144" class="blob-num js-line-number" data-line-number="144"></td>
        <td id="LC144" class="blob-code blob-code-inner js-file-line">			<span class="pl-k">end</span></td>
      </tr>
      <tr>
        <td id="L145" class="blob-num js-line-number" data-line-number="145"></td>
        <td id="LC145" class="blob-code blob-code-inner js-file-line">		<span class="pl-k">end</span></td>
      </tr>
      <tr>
        <td id="L146" class="blob-num js-line-number" data-line-number="146"></td>
        <td id="LC146" class="blob-code blob-code-inner js-file-line">		debuff_box.<span class="pl-smi">value</span> <span class="pl-k">=</span> debuff_txtbox</td>
      </tr>
      <tr>
        <td id="L147" class="blob-num js-line-number" data-line-number="147"></td>
        <td id="LC147" class="blob-code blob-code-inner js-file-line">		<span class="pl-k">if</span> boxvisible <span class="pl-k">then</span></td>
      </tr>
      <tr>
        <td id="L148" class="blob-num js-line-number" data-line-number="148"></td>
        <td id="LC148" class="blob-code blob-code-inner js-file-line">			debuff_box:<span class="pl-c1">visible</span>(<span class="pl-c1">true</span>)</td>
      </tr>
      <tr>
        <td id="L149" class="blob-num js-line-number" data-line-number="149"></td>
        <td id="LC149" class="blob-code blob-code-inner js-file-line">		<span class="pl-k">else</span> </td>
      </tr>
      <tr>
        <td id="L150" class="blob-num js-line-number" data-line-number="150"></td>
        <td id="LC150" class="blob-code blob-code-inner js-file-line">			debuff_box:<span class="pl-c1">visible</span>(<span class="pl-c1">false</span>)</td>
      </tr>
      <tr>
        <td id="L151" class="blob-num js-line-number" data-line-number="151"></td>
        <td id="LC151" class="blob-code blob-code-inner js-file-line">		<span class="pl-k">end</span></td>
      </tr>
      <tr>
        <td id="L152" class="blob-num js-line-number" data-line-number="152"></td>
        <td id="LC152" class="blob-code blob-code-inner js-file-line">	<span class="pl-k">else</span></td>
      </tr>
      <tr>
        <td id="L153" class="blob-num js-line-number" data-line-number="153"></td>
        <td id="LC153" class="blob-code blob-code-inner js-file-line">		debuff_box:<span class="pl-c1">visible</span>(<span class="pl-c1">false</span>)</td>
      </tr>
      <tr>
        <td id="L154" class="blob-num js-line-number" data-line-number="154"></td>
        <td id="LC154" class="blob-code blob-code-inner js-file-line">	<span class="pl-k">end</span></td>
      </tr>
      <tr>
        <td id="L155" class="blob-num js-line-number" data-line-number="155"></td>
        <td id="LC155" class="blob-code blob-code-inner js-file-line"><span class="pl-k">end</span>)</td>
      </tr>
      <tr>
        <td id="L156" class="blob-num js-line-number" data-line-number="156"></td>
        <td id="LC156" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L157" class="blob-num js-line-number" data-line-number="157"></td>
        <td id="LC157" class="blob-code blob-code-inner js-file-line">last_spell <span class="pl-k">=</span> <span class="pl-s"><span class="pl-pds">&#39;</span><span class="pl-pds">&#39;</span></span></td>
      </tr>
      <tr>
        <td id="L158" class="blob-num js-line-number" data-line-number="158"></td>
        <td id="LC158" class="blob-code blob-code-inner js-file-line">lullaby_spell_ids <span class="pl-k">=</span> <span class="pl-c1">S</span>{<span class="pl-c1">376</span>, <span class="pl-c1">377</span>, <span class="pl-c1">463</span>, <span class="pl-c1">471</span>}</td>
      </tr>
      <tr>
        <td id="L159" class="blob-num js-line-number" data-line-number="159"></td>
        <td id="LC159" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L160" class="blob-num js-line-number" data-line-number="160"></td>
        <td id="LC160" class="blob-code blob-code-inner js-file-line">windower.<span class="pl-c1">register_event</span>(<span class="pl-s"><span class="pl-pds">&#39;</span>incoming chunk<span class="pl-pds">&#39;</span></span>, <span class="pl-k">function</span>(<span class="pl-smi">id</span>,<span class="pl-smi">original</span>,<span class="pl-smi">modified</span>,<span class="pl-smi">injected</span>,<span class="pl-smi">blocked</span>)</td>
      </tr>
      <tr>
        <td id="L161" class="blob-num js-line-number" data-line-number="161"></td>
        <td id="LC161" class="blob-code blob-code-inner js-file-line">	<span class="pl-k">local</span> <span class="pl-c1">self</span> <span class="pl-k">=</span> windower.<span class="pl-smi">ffxi</span>.<span class="pl-c1">get_player</span>()</td>
      </tr>
      <tr>
        <td id="L162" class="blob-num js-line-number" data-line-number="162"></td>
        <td id="LC162" class="blob-code blob-code-inner js-file-line">    <span class="pl-k">if</span> id <span class="pl-k">==</span> <span class="pl-c1">0x028</span> <span class="pl-k">then</span></td>
      </tr>
      <tr>
        <td id="L163" class="blob-num js-line-number" data-line-number="163"></td>
        <td id="LC163" class="blob-code blob-code-inner js-file-line">		<span class="pl-k">local</span> packet <span class="pl-k">=</span> packets.<span class="pl-c1">parse</span>(<span class="pl-s"><span class="pl-pds">&#39;</span>incoming<span class="pl-pds">&#39;</span></span>, original)</td>
      </tr>
      <tr>
        <td id="L164" class="blob-num js-line-number" data-line-number="164"></td>
        <td id="LC164" class="blob-code blob-code-inner js-file-line">		<span class="pl-k">local</span> now <span class="pl-k">=</span> <span class="pl-c1">os.clock</span>()</td>
      </tr>
      <tr>
        <td id="L165" class="blob-num js-line-number" data-line-number="165"></td>
        <td id="LC165" class="blob-code blob-code-inner js-file-line">		</td>
      </tr>
      <tr>
        <td id="L166" class="blob-num js-line-number" data-line-number="166"></td>
        <td id="LC166" class="blob-code blob-code-inner js-file-line">		<span class="pl-k">if</span> packet[<span class="pl-s"><span class="pl-pds">&#39;</span>Category<span class="pl-pds">&#39;</span></span>] <span class="pl-k">==</span> <span class="pl-c1">8</span> <span class="pl-k">and</span> packet.<span class="pl-smi">Actor</span> <span class="pl-k">==</span> <span class="pl-c1">self</span>.<span class="pl-smi">id</span> <span class="pl-k">then</span> </td>
      </tr>
      <tr>
        <td id="L167" class="blob-num js-line-number" data-line-number="167"></td>
        <td id="LC167" class="blob-code blob-code-inner js-file-line">			last_spell <span class="pl-k">=</span> packet[<span class="pl-s"><span class="pl-pds">&#39;</span>Target 1 Action 1 Param<span class="pl-pds">&#39;</span></span>]</td>
      </tr>
      <tr>
        <td id="L168" class="blob-num js-line-number" data-line-number="168"></td>
        <td id="LC168" class="blob-code blob-code-inner js-file-line">		<span class="pl-k">end</span></td>
      </tr>
      <tr>
        <td id="L169" class="blob-num js-line-number" data-line-number="169"></td>
        <td id="LC169" class="blob-code blob-code-inner js-file-line">		</td>
      </tr>
      <tr>
        <td id="L170" class="blob-num js-line-number" data-line-number="170"></td>
        <td id="LC170" class="blob-code blob-code-inner js-file-line">		<span class="pl-k">if</span> packet[<span class="pl-s"><span class="pl-pds">&#39;</span>Category<span class="pl-pds">&#39;</span></span>] <span class="pl-k">==</span> <span class="pl-c1">4</span> <span class="pl-k">and</span> packet.<span class="pl-smi">Actor</span> <span class="pl-k">==</span> <span class="pl-c1">self</span>.<span class="pl-smi">id</span> <span class="pl-k">and</span> lullaby_spell_ids:<span class="pl-c1">contains</span>(last_spell) <span class="pl-k">then</span></td>
      </tr>
      <tr>
        <td id="L171" class="blob-num js-line-number" data-line-number="171"></td>
        <td id="LC171" class="blob-code blob-code-inner js-file-line">			<span class="pl-k">local</span> numtargets <span class="pl-k">=</span> packet[<span class="pl-s"><span class="pl-pds">&#39;</span>Target Count<span class="pl-pds">&#39;</span></span>]</td>
      </tr>
      <tr>
        <td id="L172" class="blob-num js-line-number" data-line-number="172"></td>
        <td id="LC172" class="blob-code blob-code-inner js-file-line">			<span class="pl-k">local</span> count <span class="pl-k">=</span> <span class="pl-c1">0</span></td>
      </tr>
      <tr>
        <td id="L173" class="blob-num js-line-number" data-line-number="173"></td>
        <td id="LC173" class="blob-code blob-code-inner js-file-line">			</td>
      </tr>
      <tr>
        <td id="L174" class="blob-num js-line-number" data-line-number="174"></td>
        <td id="LC174" class="blob-code blob-code-inner js-file-line">			<span class="pl-k">if</span> packet.<span class="pl-smi">Actor</span> <span class="pl-k">==</span> <span class="pl-c1">self</span>.<span class="pl-smi">id</span> <span class="pl-k">then</span></td>
      </tr>
      <tr>
        <td id="L175" class="blob-num js-line-number" data-line-number="175"></td>
        <td id="LC175" class="blob-code blob-code-inner js-file-line">				<span class="pl-k">while</span> count <span class="pl-k">&lt;</span> numtargets <span class="pl-k">do</span></td>
      </tr>
      <tr>
        <td id="L176" class="blob-num js-line-number" data-line-number="176"></td>
        <td id="LC176" class="blob-code blob-code-inner js-file-line">					count <span class="pl-k">=</span> count <span class="pl-k">+</span> <span class="pl-c1">1</span></td>
      </tr>
      <tr>
        <td id="L177" class="blob-num js-line-number" data-line-number="177"></td>
        <td id="LC177" class="blob-code blob-code-inner js-file-line">					<span class="pl-k">local</span> target_id <span class="pl-k">=</span> packet[<span class="pl-s"><span class="pl-pds">&#39;</span>Target <span class="pl-pds">&#39;</span></span><span class="pl-k">..</span>count<span class="pl-k">..</span><span class="pl-s"><span class="pl-pds">&#39;</span> ID<span class="pl-pds">&#39;</span></span>]</td>
      </tr>
      <tr>
        <td id="L178" class="blob-num js-line-number" data-line-number="178"></td>
        <td id="LC178" class="blob-code blob-code-inner js-file-line">					<span class="pl-k">local</span> spell_duration <span class="pl-k">=</span> <span class="pl-c1">calculate_duration_raw</span>(last_spell)</td>
      </tr>
      <tr>
        <td id="L179" class="blob-num js-line-number" data-line-number="179"></td>
        <td id="LC179" class="blob-code blob-code-inner js-file-line">					<span class="pl-k">local</span> message <span class="pl-k">=</span> packet[<span class="pl-s"><span class="pl-pds">&#39;</span>Target <span class="pl-pds">&#39;</span></span><span class="pl-k">..</span>count<span class="pl-k">..</span><span class="pl-s"><span class="pl-pds">&#39;</span> Action 1 Message<span class="pl-pds">&#39;</span></span>]</td>
      </tr>
      <tr>
        <td id="L180" class="blob-num js-line-number" data-line-number="180"></td>
        <td id="LC180" class="blob-code blob-code-inner js-file-line">					<span class="pl-k">if</span> message <span class="pl-k">==</span> <span class="pl-c1">270</span> <span class="pl-k">or</span> message <span class="pl-k">==</span> <span class="pl-c1">236</span> <span class="pl-k">then</span> </td>
      </tr>
      <tr>
        <td id="L181" class="blob-num js-line-number" data-line-number="181"></td>
        <td id="LC181" class="blob-code blob-code-inner js-file-line">						<span class="pl-c1">new_sleep</span>(target_id, spell_duration)</td>
      </tr>
      <tr>
        <td id="L182" class="blob-num js-line-number" data-line-number="182"></td>
        <td id="LC182" class="blob-code blob-code-inner js-file-line">					<span class="pl-k">end</span></td>
      </tr>
      <tr>
        <td id="L183" class="blob-num js-line-number" data-line-number="183"></td>
        <td id="LC183" class="blob-code blob-code-inner js-file-line">				<span class="pl-k">end</span></td>
      </tr>
      <tr>
        <td id="L184" class="blob-num js-line-number" data-line-number="184"></td>
        <td id="LC184" class="blob-code blob-code-inner js-file-line">				</td>
      </tr>
      <tr>
        <td id="L185" class="blob-num js-line-number" data-line-number="185"></td>
        <td id="LC185" class="blob-code blob-code-inner js-file-line">			<span class="pl-k">end</span></td>
      </tr>
      <tr>
        <td id="L186" class="blob-num js-line-number" data-line-number="186"></td>
        <td id="LC186" class="blob-code blob-code-inner js-file-line">		<span class="pl-k">end</span></td>
      </tr>
      <tr>
        <td id="L187" class="blob-num js-line-number" data-line-number="187"></td>
        <td id="LC187" class="blob-code blob-code-inner js-file-line">		</td>
      </tr>
      <tr>
        <td id="L188" class="blob-num js-line-number" data-line-number="188"></td>
        <td id="LC188" class="blob-code blob-code-inner js-file-line">		</td>
      </tr>
      <tr>
        <td id="L189" class="blob-num js-line-number" data-line-number="189"></td>
        <td id="LC189" class="blob-code blob-code-inner js-file-line">		<span class="pl-k">if</span> monster_list[packet.<span class="pl-smi">Actor</span>] <span class="pl-k">and</span> ((now <span class="pl-k">-</span> monster_list[packet.<span class="pl-smi">Actor</span>].<span class="pl-smi">start</span>) <span class="pl-k">&gt;</span> <span class="pl-c1">5</span>) <span class="pl-k">then</span> </td>
      </tr>
      <tr>
        <td id="L190" class="blob-num js-line-number" data-line-number="190"></td>
        <td id="LC190" class="blob-code blob-code-inner js-file-line">			monster_list[packet.<span class="pl-smi">Actor</span>] <span class="pl-k">=</span> {start<span class="pl-k">=</span>monster_list[packet.<span class="pl-smi">Actor</span>].<span class="pl-smi">start</span>,debuff_duration<span class="pl-k">=</span><span class="pl-c1">0</span>}</td>
      </tr>
      <tr>
        <td id="L191" class="blob-num js-line-number" data-line-number="191"></td>
        <td id="LC191" class="blob-code blob-code-inner js-file-line">		<span class="pl-k">end</span></td>
      </tr>
      <tr>
        <td id="L192" class="blob-num js-line-number" data-line-number="192"></td>
        <td id="LC192" class="blob-code blob-code-inner js-file-line">	<span class="pl-k">end</span></td>
      </tr>
      <tr>
        <td id="L193" class="blob-num js-line-number" data-line-number="193"></td>
        <td id="LC193" class="blob-code blob-code-inner js-file-line"><span class="pl-k">end</span>)</td>
      </tr>
      <tr>
        <td id="L194" class="blob-num js-line-number" data-line-number="194"></td>
        <td id="LC194" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L195" class="blob-num js-line-number" data-line-number="195"></td>
        <td id="LC195" class="blob-code blob-code-inner js-file-line">windower.<span class="pl-c1">register_event</span>(<span class="pl-s"><span class="pl-pds">&#39;</span>zone change<span class="pl-pds">&#39;</span></span>,<span class="pl-k">function</span>()</td>
      </tr>
      <tr>
        <td id="L196" class="blob-num js-line-number" data-line-number="196"></td>
        <td id="LC196" class="blob-code blob-code-inner js-file-line">	<span class="pl-c1">reset_list</span>()</td>
      </tr>
      <tr>
        <td id="L197" class="blob-num js-line-number" data-line-number="197"></td>
        <td id="LC197" class="blob-code blob-code-inner js-file-line"><span class="pl-k">end</span>)</td>
      </tr>
      <tr>
        <td id="L198" class="blob-num js-line-number" data-line-number="198"></td>
        <td id="LC198" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L199" class="blob-num js-line-number" data-line-number="199"></td>
        <td id="LC199" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L200" class="blob-num js-line-number" data-line-number="200"></td>
        <td id="LC200" class="blob-code blob-code-inner js-file-line"><span class="pl-k">function</span> <span class="pl-en">calculate_duration_raw</span>(<span class="pl-smi">spell_id</span>)</td>
      </tr>
      <tr>
        <td id="L201" class="blob-num js-line-number" data-line-number="201"></td>
        <td id="LC201" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L202" class="blob-num js-line-number" data-line-number="202"></td>
        <td id="LC202" class="blob-code blob-code-inner js-file-line">	<span class="pl-k">local</span> <span class="pl-c1">self</span> <span class="pl-k">=</span> windower.<span class="pl-smi">ffxi</span>.<span class="pl-c1">get_player</span>()</td>
      </tr>
      <tr>
        <td id="L203" class="blob-num js-line-number" data-line-number="203"></td>
        <td id="LC203" class="blob-code blob-code-inner js-file-line">	</td>
      </tr>
      <tr>
        <td id="L204" class="blob-num js-line-number" data-line-number="204"></td>
        <td id="LC204" class="blob-code blob-code-inner js-file-line">	<span class="pl-k">local</span> troubadour <span class="pl-k">=</span> <span class="pl-c1">false</span></td>
      </tr>
      <tr>
        <td id="L205" class="blob-num js-line-number" data-line-number="205"></td>
        <td id="LC205" class="blob-code blob-code-inner js-file-line">	<span class="pl-k">local</span> clarioncall <span class="pl-k">=</span> <span class="pl-c1">false</span></td>
      </tr>
      <tr>
        <td id="L206" class="blob-num js-line-number" data-line-number="206"></td>
        <td id="LC206" class="blob-code blob-code-inner js-file-line">	<span class="pl-k">local</span> soulvoice <span class="pl-k">=</span> <span class="pl-c1">false</span></td>
      </tr>
      <tr>
        <td id="L207" class="blob-num js-line-number" data-line-number="207"></td>
        <td id="LC207" class="blob-code blob-code-inner js-file-line">	<span class="pl-k">local</span> marcato <span class="pl-k">=</span> <span class="pl-c1">false</span></td>
      </tr>
      <tr>
        <td id="L208" class="blob-num js-line-number" data-line-number="208"></td>
        <td id="LC208" class="blob-code blob-code-inner js-file-line">	</td>
      </tr>
      <tr>
        <td id="L209" class="blob-num js-line-number" data-line-number="209"></td>
        <td id="LC209" class="blob-code blob-code-inner js-file-line">	<span class="pl-k">for</span> i,v <span class="pl-k">in</span> <span class="pl-c1">pairs</span>(<span class="pl-c1">self</span>.<span class="pl-smi">buffs</span>) <span class="pl-k">do</span></td>
      </tr>
      <tr>
        <td id="L210" class="blob-num js-line-number" data-line-number="210"></td>
        <td id="LC210" class="blob-code blob-code-inner js-file-line">		<span class="pl-k">if</span> v <span class="pl-k">==</span> <span class="pl-c1">348</span> <span class="pl-k">then</span> troubadour <span class="pl-k">=</span> <span class="pl-c1">true</span> <span class="pl-k">end</span></td>
      </tr>
      <tr>
        <td id="L211" class="blob-num js-line-number" data-line-number="211"></td>
        <td id="LC211" class="blob-code blob-code-inner js-file-line">		<span class="pl-k">if</span> v <span class="pl-k">==</span> <span class="pl-c1">499</span> <span class="pl-k">then</span> clarioncall <span class="pl-k">=</span> <span class="pl-c1">true</span> <span class="pl-k">end</span></td>
      </tr>
      <tr>
        <td id="L212" class="blob-num js-line-number" data-line-number="212"></td>
        <td id="LC212" class="blob-code blob-code-inner js-file-line">		<span class="pl-k">if</span> v <span class="pl-k">==</span> <span class="pl-c1">52</span> <span class="pl-k">then</span> soulvoice <span class="pl-k">=</span> <span class="pl-c1">true</span> <span class="pl-k">end</span></td>
      </tr>
      <tr>
        <td id="L213" class="blob-num js-line-number" data-line-number="213"></td>
        <td id="LC213" class="blob-code blob-code-inner js-file-line">		<span class="pl-k">if</span> v <span class="pl-k">==</span> <span class="pl-c1">231</span> <span class="pl-k">then</span> marcato <span class="pl-k">=</span> <span class="pl-c1">true</span> <span class="pl-k">end</span></td>
      </tr>
      <tr>
        <td id="L214" class="blob-num js-line-number" data-line-number="214"></td>
        <td id="LC214" class="blob-code blob-code-inner js-file-line">	<span class="pl-k">end</span></td>
      </tr>
      <tr>
        <td id="L215" class="blob-num js-line-number" data-line-number="215"></td>
        <td id="LC215" class="blob-code blob-code-inner js-file-line">	</td>
      </tr>
      <tr>
        <td id="L216" class="blob-num js-line-number" data-line-number="216"></td>
        <td id="LC216" class="blob-code blob-code-inner js-file-line">	</td>
      </tr>
      <tr>
        <td id="L217" class="blob-num js-line-number" data-line-number="217"></td>
        <td id="LC217" class="blob-code blob-code-inner js-file-line">	spell <span class="pl-k">=</span> res.<span class="pl-smi">spells</span>[spell_id]</td>
      </tr>
      <tr>
        <td id="L218" class="blob-num js-line-number" data-line-number="218"></td>
        <td id="LC218" class="blob-code blob-code-inner js-file-line">    <span class="pl-k">local</span> mult <span class="pl-k">=</span> <span class="pl-c1">1</span></td>
      </tr>
      <tr>
        <td id="L219" class="blob-num js-line-number" data-line-number="219"></td>
        <td id="LC219" class="blob-code blob-code-inner js-file-line">	</td>
      </tr>
      <tr>
        <td id="L220" class="blob-num js-line-number" data-line-number="220"></td>
        <td id="LC220" class="blob-code blob-code-inner js-file-line">	<span class="pl-k">local</span> gear <span class="pl-k">=</span> windower.<span class="pl-smi">ffxi</span>.<span class="pl-c1">get_items</span>()</td>
      </tr>
      <tr>
        <td id="L221" class="blob-num js-line-number" data-line-number="221"></td>
        <td id="LC221" class="blob-code blob-code-inner js-file-line">	<span class="pl-k">local</span> mainweapon <span class="pl-k">=</span> res.<span class="pl-smi">items</span>[windower.<span class="pl-smi">ffxi</span>.<span class="pl-c1">get_items</span>(gear.<span class="pl-smi">equipment</span>.<span class="pl-smi">main_bag</span>, gear.<span class="pl-smi">equipment</span>.<span class="pl-smi">main</span>).<span class="pl-smi">id</span>]</td>
      </tr>
      <tr>
        <td id="L222" class="blob-num js-line-number" data-line-number="222"></td>
        <td id="LC222" class="blob-code blob-code-inner js-file-line">	<span class="pl-k">local</span> subweapon <span class="pl-k">=</span> res.<span class="pl-smi">items</span>[windower.<span class="pl-smi">ffxi</span>.<span class="pl-c1">get_items</span>(gear.<span class="pl-smi">equipment</span>.<span class="pl-smi">sub_bag</span>, gear.<span class="pl-smi">equipment</span>.<span class="pl-smi">sub</span>).<span class="pl-smi">id</span>]</td>
      </tr>
      <tr>
        <td id="L223" class="blob-num js-line-number" data-line-number="223"></td>
        <td id="LC223" class="blob-code blob-code-inner js-file-line">	<span class="pl-k">local</span> range <span class="pl-k">=</span> res.<span class="pl-smi">items</span>[windower.<span class="pl-smi">ffxi</span>.<span class="pl-c1">get_items</span>(gear.<span class="pl-smi">equipment</span>.<span class="pl-smi">range_bag</span>, gear.<span class="pl-smi">equipment</span>.<span class="pl-smi">range</span>).<span class="pl-smi">id</span>]</td>
      </tr>
      <tr>
        <td id="L224" class="blob-num js-line-number" data-line-number="224"></td>
        <td id="LC224" class="blob-code blob-code-inner js-file-line">	<span class="pl-k">local</span> ammo <span class="pl-k">=</span> res.<span class="pl-smi">items</span>[windower.<span class="pl-smi">ffxi</span>.<span class="pl-c1">get_items</span>(gear.<span class="pl-smi">equipment</span>.<span class="pl-smi">ammo_bag</span>, gear.<span class="pl-smi">equipment</span>.<span class="pl-smi">ammo</span>).<span class="pl-smi">id</span>]</td>
      </tr>
      <tr>
        <td id="L225" class="blob-num js-line-number" data-line-number="225"></td>
        <td id="LC225" class="blob-code blob-code-inner js-file-line">	<span class="pl-k">local</span> head <span class="pl-k">=</span> res.<span class="pl-smi">items</span>[windower.<span class="pl-smi">ffxi</span>.<span class="pl-c1">get_items</span>(gear.<span class="pl-smi">equipment</span>.<span class="pl-smi">head_bag</span>, gear.<span class="pl-smi">equipment</span>.<span class="pl-smi">head</span>).<span class="pl-smi">id</span>]</td>
      </tr>
      <tr>
        <td id="L226" class="blob-num js-line-number" data-line-number="226"></td>
        <td id="LC226" class="blob-code blob-code-inner js-file-line">	<span class="pl-k">local</span> neck <span class="pl-k">=</span> res.<span class="pl-smi">items</span>[windower.<span class="pl-smi">ffxi</span>.<span class="pl-c1">get_items</span>(gear.<span class="pl-smi">equipment</span>.<span class="pl-smi">neck_bag</span>, gear.<span class="pl-smi">equipment</span>.<span class="pl-smi">neck</span>).<span class="pl-smi">id</span>]</td>
      </tr>
      <tr>
        <td id="L227" class="blob-num js-line-number" data-line-number="227"></td>
        <td id="LC227" class="blob-code blob-code-inner js-file-line">	<span class="pl-k">local</span> ear1 <span class="pl-k">=</span> res.<span class="pl-smi">items</span>[windower.<span class="pl-smi">ffxi</span>.<span class="pl-c1">get_items</span>(gear.<span class="pl-smi">equipment</span>.<span class="pl-smi">left_ear_bag</span>, gear.<span class="pl-smi">equipment</span>.<span class="pl-smi">left_ear</span>).<span class="pl-smi">id</span>]</td>
      </tr>
      <tr>
        <td id="L228" class="blob-num js-line-number" data-line-number="228"></td>
        <td id="LC228" class="blob-code blob-code-inner js-file-line">	<span class="pl-k">local</span> ear2 <span class="pl-k">=</span> res.<span class="pl-smi">items</span>[windower.<span class="pl-smi">ffxi</span>.<span class="pl-c1">get_items</span>(gear.<span class="pl-smi">equipment</span>.<span class="pl-smi">right_ear_bag</span>, gear.<span class="pl-smi">equipment</span>.<span class="pl-smi">right_ear</span>).<span class="pl-smi">id</span>]</td>
      </tr>
      <tr>
        <td id="L229" class="blob-num js-line-number" data-line-number="229"></td>
        <td id="LC229" class="blob-code blob-code-inner js-file-line">	<span class="pl-k">local</span> body <span class="pl-k">=</span> res.<span class="pl-smi">items</span>[windower.<span class="pl-smi">ffxi</span>.<span class="pl-c1">get_items</span>(gear.<span class="pl-smi">equipment</span>.<span class="pl-smi">body_bag</span>, gear.<span class="pl-smi">equipment</span>.<span class="pl-smi">body</span>).<span class="pl-smi">id</span>]</td>
      </tr>
      <tr>
        <td id="L230" class="blob-num js-line-number" data-line-number="230"></td>
        <td id="LC230" class="blob-code blob-code-inner js-file-line">	<span class="pl-k">local</span> hands <span class="pl-k">=</span> res.<span class="pl-smi">items</span>[windower.<span class="pl-smi">ffxi</span>.<span class="pl-c1">get_items</span>(gear.<span class="pl-smi">equipment</span>.<span class="pl-smi">hands_bag</span>, gear.<span class="pl-smi">equipment</span>.<span class="pl-smi">hands</span>).<span class="pl-smi">id</span>]</td>
      </tr>
      <tr>
        <td id="L231" class="blob-num js-line-number" data-line-number="231"></td>
        <td id="LC231" class="blob-code blob-code-inner js-file-line">	<span class="pl-k">local</span> ring1 <span class="pl-k">=</span> res.<span class="pl-smi">items</span>[windower.<span class="pl-smi">ffxi</span>.<span class="pl-c1">get_items</span>(gear.<span class="pl-smi">equipment</span>.<span class="pl-smi">left_ring_bag</span>, gear.<span class="pl-smi">equipment</span>.<span class="pl-smi">right_ring</span>).<span class="pl-smi">id</span>]</td>
      </tr>
      <tr>
        <td id="L232" class="blob-num js-line-number" data-line-number="232"></td>
        <td id="LC232" class="blob-code blob-code-inner js-file-line">	<span class="pl-k">local</span> ring2 <span class="pl-k">=</span> res.<span class="pl-smi">items</span>[windower.<span class="pl-smi">ffxi</span>.<span class="pl-c1">get_items</span>(gear.<span class="pl-smi">equipment</span>.<span class="pl-smi">right_ring_bag</span>, gear.<span class="pl-smi">equipment</span>.<span class="pl-smi">left_ring</span>).<span class="pl-smi">id</span>]</td>
      </tr>
      <tr>
        <td id="L233" class="blob-num js-line-number" data-line-number="233"></td>
        <td id="LC233" class="blob-code blob-code-inner js-file-line">	<span class="pl-k">local</span> back <span class="pl-k">=</span> res.<span class="pl-smi">items</span>[windower.<span class="pl-smi">ffxi</span>.<span class="pl-c1">get_items</span>(gear.<span class="pl-smi">equipment</span>.<span class="pl-smi">back_bag</span>, gear.<span class="pl-smi">equipment</span>.<span class="pl-smi">back</span>).<span class="pl-smi">id</span>]</td>
      </tr>
      <tr>
        <td id="L234" class="blob-num js-line-number" data-line-number="234"></td>
        <td id="LC234" class="blob-code blob-code-inner js-file-line">	<span class="pl-k">local</span> waist <span class="pl-k">=</span> res.<span class="pl-smi">items</span>[windower.<span class="pl-smi">ffxi</span>.<span class="pl-c1">get_items</span>(gear.<span class="pl-smi">equipment</span>.<span class="pl-smi">waist_bag</span>, gear.<span class="pl-smi">equipment</span>.<span class="pl-smi">waist</span>).<span class="pl-smi">id</span>]</td>
      </tr>
      <tr>
        <td id="L235" class="blob-num js-line-number" data-line-number="235"></td>
        <td id="LC235" class="blob-code blob-code-inner js-file-line">	<span class="pl-k">local</span> legs <span class="pl-k">=</span> res.<span class="pl-smi">items</span>[windower.<span class="pl-smi">ffxi</span>.<span class="pl-c1">get_items</span>(gear.<span class="pl-smi">equipment</span>.<span class="pl-smi">legs_bag</span>, gear.<span class="pl-smi">equipment</span>.<span class="pl-smi">legs</span>).<span class="pl-smi">id</span>]</td>
      </tr>
      <tr>
        <td id="L236" class="blob-num js-line-number" data-line-number="236"></td>
        <td id="LC236" class="blob-code blob-code-inner js-file-line">	<span class="pl-k">local</span> feet <span class="pl-k">=</span> res.<span class="pl-smi">items</span>[windower.<span class="pl-smi">ffxi</span>.<span class="pl-c1">get_items</span>(gear.<span class="pl-smi">equipment</span>.<span class="pl-smi">feet_bag</span>, gear.<span class="pl-smi">equipment</span>.<span class="pl-smi">feet</span>).<span class="pl-smi">id</span>]</td>
      </tr>
      <tr>
        <td id="L237" class="blob-num js-line-number" data-line-number="237"></td>
        <td id="LC237" class="blob-code blob-code-inner js-file-line">	</td>
      </tr>
      <tr>
        <td id="L238" class="blob-num js-line-number" data-line-number="238"></td>
        <td id="LC238" class="blob-code blob-code-inner js-file-line">    <span class="pl-k">if</span> range.<span class="pl-smi">id</span> <span class="pl-k">==</span> <span class="pl-c1">18575</span> <span class="pl-k">then</span> mult <span class="pl-k">=</span> mult <span class="pl-k">+</span> <span class="pl-c1">0.25</span> <span class="pl-k">end</span> <span class="pl-c"><span class="pl-c">--</span> Daurdabla LVL 90</span></td>
      </tr>
      <tr>
        <td id="L239" class="blob-num js-line-number" data-line-number="239"></td>
        <td id="LC239" class="blob-code blob-code-inner js-file-line">	<span class="pl-k">if</span> range.<span class="pl-smi">id</span> <span class="pl-k">==</span> <span class="pl-c1">18571</span> <span class="pl-k">or</span> range.<span class="pl-smi">id</span> <span class="pl-k">==</span> <span class="pl-c1">18576</span> <span class="pl-k">or</span> range.<span class="pl-smi">id</span> <span class="pl-k">==</span> <span class="pl-c1">18839</span> <span class="pl-k">then</span> mult <span class="pl-k">=</span> mult <span class="pl-k">+</span> <span class="pl-c1">0.3</span> <span class="pl-k">end</span> <span class="pl-c"><span class="pl-c">--</span> Daurdabla LVL 99 | LVL 95 | AG LVL 99</span></td>
      </tr>
      <tr>
        <td id="L240" class="blob-num js-line-number" data-line-number="240"></td>
        <td id="LC240" class="blob-code blob-code-inner js-file-line">	<span class="pl-k">if</span> range.<span class="pl-smi">id</span> <span class="pl-k">==</span> <span class="pl-c1">18342</span> <span class="pl-k">or</span> range.<span class="pl-smi">id</span> <span class="pl-k">==</span> <span class="pl-c1">18577</span> <span class="pl-k">or</span> range.<span class="pl-smi">id</span> <span class="pl-k">==</span> <span class="pl-c1">18578</span> <span class="pl-k">then</span> mult <span class="pl-k">=</span> mult <span class="pl-k">+</span> <span class="pl-c1">0.2</span> <span class="pl-k">end</span> <span class="pl-c"><span class="pl-c">--</span> Gjallarhorn LVL 75 | LVL 80 | LVL 85</span></td>
      </tr>
      <tr>
        <td id="L241" class="blob-num js-line-number" data-line-number="241"></td>
        <td id="LC241" class="blob-code blob-code-inner js-file-line">	<span class="pl-k">if</span> range.<span class="pl-smi">id</span> <span class="pl-k">==</span> <span class="pl-c1">18579</span> <span class="pl-k">or</span> range.<span class="pl-smi">id</span> <span class="pl-k">==</span> <span class="pl-c1">18580</span> <span class="pl-k">then</span> mult <span class="pl-k">=</span> mult <span class="pl-k">+</span> <span class="pl-c1">0.3</span> <span class="pl-k">end</span> <span class="pl-c"><span class="pl-c">--</span> Gjallarhorn LVL 90 | LVL 95</span></td>
      </tr>
      <tr>
        <td id="L242" class="blob-num js-line-number" data-line-number="242"></td>
        <td id="LC242" class="blob-code blob-code-inner js-file-line">	<span class="pl-k">if</span> range.<span class="pl-smi">id</span> <span class="pl-k">==</span> <span class="pl-c1">18840</span> <span class="pl-k">or</span> range.<span class="pl-smi">id</span> <span class="pl-k">==</span> <span class="pl-c1">18572</span> <span class="pl-k">then</span> mult <span class="pl-k">=</span> mult <span class="pl-k">+</span> <span class="pl-c1">0.4</span> <span class="pl-k">end</span> <span class="pl-c"><span class="pl-c">--</span> Gjallarhorn LVL 99 | AG LVL 99</span></td>
      </tr>
      <tr>
        <td id="L243" class="blob-num js-line-number" data-line-number="243"></td>
        <td id="LC243" class="blob-code blob-code-inner js-file-line">	<span class="pl-k">if</span> range.<span class="pl-smi">id</span> <span class="pl-k">==</span> <span class="pl-c1">21398</span> <span class="pl-k">then</span> mult <span class="pl-k">=</span> mult <span class="pl-k">+</span> <span class="pl-c1">0.5</span> <span class="pl-k">end</span> <span class="pl-c"><span class="pl-c">--</span> Marsyas</span></td>
      </tr>
      <tr>
        <td id="L244" class="blob-num js-line-number" data-line-number="244"></td>
        <td id="LC244" class="blob-code blob-code-inner js-file-line">	</td>
      </tr>
      <tr>
        <td id="L245" class="blob-num js-line-number" data-line-number="245"></td>
        <td id="LC245" class="blob-code blob-code-inner js-file-line">	<span class="pl-c"><span class="pl-c">--</span> Give your own math.  Songs + each give 10% per song+.   There are several song+ instruments; Some with Augments (Linos, Nibiru Harp).</span></td>
      </tr>
      <tr>
        <td id="L246" class="blob-num js-line-number" data-line-number="246"></td>
        <td id="LC246" class="blob-code blob-code-inner js-file-line">	<span class="pl-c"><span class="pl-c">--</span> You&#39;ll need to add your own here.  I will make some assumptions anyone using a Linos has a +1 augment and anyone using a Nibiru Harp is augmented Path C.</span></td>
      </tr>
      <tr>
        <td id="L247" class="blob-num js-line-number" data-line-number="247"></td>
        <td id="LC247" class="blob-code blob-code-inner js-file-line">	<span class="pl-k">if</span> range.<span class="pl-smi">en</span> <span class="pl-k">==</span> <span class="pl-s"><span class="pl-pds">&quot;</span>Nibiru Harp<span class="pl-pds">&quot;</span></span> <span class="pl-k">then</span> mult <span class="pl-k">=</span> mult <span class="pl-k">+</span> <span class="pl-c1">0.2</span> <span class="pl-k">end</span></td>
      </tr>
      <tr>
        <td id="L248" class="blob-num js-line-number" data-line-number="248"></td>
        <td id="LC248" class="blob-code blob-code-inner js-file-line">	<span class="pl-k">if</span> range.<span class="pl-smi">en</span> <span class="pl-k">==</span> <span class="pl-s"><span class="pl-pds">&quot;</span>Linos<span class="pl-pds">&quot;</span></span> <span class="pl-k">then</span> mult <span class="pl-k">=</span> mult <span class="pl-k">+</span> <span class="pl-c1">0.3</span> <span class="pl-k">end</span> </td>
      </tr>
      <tr>
        <td id="L249" class="blob-num js-line-number" data-line-number="249"></td>
        <td id="LC249" class="blob-code blob-code-inner js-file-line">	<span class="pl-k">if</span> range.<span class="pl-smi">en</span> <span class="pl-k">==</span> <span class="pl-s"><span class="pl-pds">&quot;</span>Blurred Harp<span class="pl-pds">&quot;</span></span> <span class="pl-k">then</span> mult <span class="pl-k">=</span> mult <span class="pl-k">+</span> <span class="pl-c1">0.3</span> <span class="pl-k">end</span></td>
      </tr>
      <tr>
        <td id="L250" class="blob-num js-line-number" data-line-number="250"></td>
        <td id="LC250" class="blob-code blob-code-inner js-file-line">	<span class="pl-k">if</span> range.<span class="pl-smi">en</span> <span class="pl-k">==</span> <span class="pl-s"><span class="pl-pds">&quot;</span>Blurred Harp +1<span class="pl-pds">&quot;</span></span> <span class="pl-k">then</span> mult <span class="pl-k">=</span> mult <span class="pl-k">+</span> <span class="pl-c1">0.4</span> <span class="pl-k">end</span></td>
      </tr>
      <tr>
        <td id="L251" class="blob-num js-line-number" data-line-number="251"></td>
        <td id="LC251" class="blob-code blob-code-inner js-file-line">	<span class="pl-k">if</span> range.<span class="pl-smi">en</span> <span class="pl-k">==</span> <span class="pl-s"><span class="pl-pds">&quot;</span>Mary&#39;s Horn<span class="pl-pds">&quot;</span></span> <span class="pl-k">then</span> mult <span class="pl-k">=</span> mult <span class="pl-k">+</span> <span class="pl-c1">0.1</span> <span class="pl-k">end</span></td>
      </tr>
      <tr>
        <td id="L252" class="blob-num js-line-number" data-line-number="252"></td>
        <td id="LC252" class="blob-code blob-code-inner js-file-line">	<span class="pl-k">if</span> range.<span class="pl-smi">en</span> <span class="pl-k">==</span> <span class="pl-s"><span class="pl-pds">&quot;</span>Cradle Horn<span class="pl-pds">&quot;</span></span> <span class="pl-k">then</span> mult <span class="pl-k">=</span> mult <span class="pl-k">+</span> <span class="pl-c1">0.2</span> <span class="pl-k">end</span></td>
      </tr>
      <tr>
        <td id="L253" class="blob-num js-line-number" data-line-number="253"></td>
        <td id="LC253" class="blob-code blob-code-inner js-file-line">	<span class="pl-k">if</span> range.<span class="pl-smi">en</span> <span class="pl-k">==</span> <span class="pl-s"><span class="pl-pds">&quot;</span>Pan&#39;s Horn<span class="pl-pds">&quot;</span></span> <span class="pl-k">then</span> mult <span class="pl-k">=</span> mult <span class="pl-k">+</span> <span class="pl-c1">0.3</span> <span class="pl-k">end</span></td>
      </tr>
      <tr>
        <td id="L254" class="blob-num js-line-number" data-line-number="254"></td>
        <td id="LC254" class="blob-code blob-code-inner js-file-line">	</td>
      </tr>
      <tr>
        <td id="L255" class="blob-num js-line-number" data-line-number="255"></td>
        <td id="LC255" class="blob-code blob-code-inner js-file-line">	</td>
      </tr>
      <tr>
        <td id="L256" class="blob-num js-line-number" data-line-number="256"></td>
        <td id="LC256" class="blob-code blob-code-inner js-file-line">	<span class="pl-k">if</span> mainweapon.<span class="pl-smi">id</span> <span class="pl-k">==</span> <span class="pl-c1">18980</span> <span class="pl-k">or</span> mainweapon.<span class="pl-smi">id</span> <span class="pl-k">==</span> <span class="pl-c1">19000</span> <span class="pl-k">then</span> mult <span class="pl-k">=</span> mult <span class="pl-k">+</span> <span class="pl-c1">0.1</span> <span class="pl-k">end</span> <span class="pl-c"><span class="pl-c">--</span> Carnwenhan LVL 75</span></td>
      </tr>
      <tr>
        <td id="L257" class="blob-num js-line-number" data-line-number="257"></td>
        <td id="LC257" class="blob-code blob-code-inner js-file-line">    <span class="pl-k">if</span> mainweapon.<span class="pl-smi">id</span> <span class="pl-k">==</span> <span class="pl-c1">19069</span> <span class="pl-k">then</span> mult <span class="pl-k">=</span> mult <span class="pl-k">+</span> <span class="pl-c1">0.2</span> <span class="pl-k">end</span> <span class="pl-c"><span class="pl-c">--</span> Carnwenhan LVL 80</span></td>
      </tr>
      <tr>
        <td id="L258" class="blob-num js-line-number" data-line-number="258"></td>
        <td id="LC258" class="blob-code blob-code-inner js-file-line">	<span class="pl-k">if</span> mainweapon.<span class="pl-smi">id</span> <span class="pl-k">==</span> <span class="pl-c1">19089</span> <span class="pl-k">then</span> mult <span class="pl-k">=</span> mult <span class="pl-k">+</span> <span class="pl-c1">0.3</span> <span class="pl-k">end</span> <span class="pl-c"><span class="pl-c">--</span> Carnwenhan LVL 85</span></td>
      </tr>
      <tr>
        <td id="L259" class="blob-num js-line-number" data-line-number="259"></td>
        <td id="LC259" class="blob-code blob-code-inner js-file-line">	<span class="pl-k">if</span> mainweapon.<span class="pl-smi">id</span> <span class="pl-k">==</span> <span class="pl-c1">19621</span> <span class="pl-k">or</span> mainweapon.<span class="pl-smi">id</span> <span class="pl-k">==</span> <span class="pl-c1">19719</span> <span class="pl-k">then</span> mult <span class="pl-k">=</span> mult <span class="pl-k">+</span> <span class="pl-c1">0.4</span> <span class="pl-k">end</span> <span class="pl-c"><span class="pl-c">--</span> Carnwenhan LVL 90 | LVL 95</span></td>
      </tr>
      <tr>
        <td id="L260" class="blob-num js-line-number" data-line-number="260"></td>
        <td id="LC260" class="blob-code blob-code-inner js-file-line">	<span class="pl-k">if</span> mainweapon.<span class="pl-smi">id</span> <span class="pl-k">==</span> <span class="pl-c1">19828</span> <span class="pl-k">or</span> mainweapon.<span class="pl-smi">id</span> <span class="pl-k">==</span> <span class="pl-c1">19957</span> <span class="pl-k">or</span> mainweapon.<span class="pl-smi">id</span> <span class="pl-k">==</span> <span class="pl-c1">20561</span> <span class="pl-k">or</span> mainweapon.<span class="pl-smi">id</span> <span class="pl-k">==</span> <span class="pl-c1">20562</span> <span class="pl-k">or</span> mainweapon.<span class="pl-smi">id</span> <span class="pl-k">==</span> <span class="pl-c1">20586</span> <span class="pl-k">then</span> mult <span class="pl-k">=</span> mult <span class="pl-k">+</span> <span class="pl-c1">0.5</span> <span class="pl-k">end</span> <span class="pl-c"><span class="pl-c">--</span> Carnwenhan LVL 99 - 119 AG</span></td>
      </tr>
      <tr>
        <td id="L261" class="blob-num js-line-number" data-line-number="261"></td>
        <td id="LC261" class="blob-code blob-code-inner js-file-line">	</td>
      </tr>
      <tr>
        <td id="L262" class="blob-num js-line-number" data-line-number="262"></td>
        <td id="LC262" class="blob-code blob-code-inner js-file-line">	<span class="pl-k">if</span> subweapon.<span class="pl-smi">id</span> <span class="pl-k">==</span> <span class="pl-c1">18980</span> <span class="pl-k">or</span> subweapon.<span class="pl-smi">id</span> <span class="pl-k">==</span> <span class="pl-c1">19000</span> <span class="pl-k">then</span> mult <span class="pl-k">=</span> mult <span class="pl-k">+</span> <span class="pl-c1">0.1</span> <span class="pl-k">end</span> <span class="pl-c"><span class="pl-c">--</span> Carnwenhan LVL 75</span></td>
      </tr>
      <tr>
        <td id="L263" class="blob-num js-line-number" data-line-number="263"></td>
        <td id="LC263" class="blob-code blob-code-inner js-file-line">    <span class="pl-k">if</span> subweapon.<span class="pl-smi">id</span> <span class="pl-k">==</span> <span class="pl-c1">19069</span> <span class="pl-k">then</span> mult <span class="pl-k">=</span> mult <span class="pl-k">+</span> <span class="pl-c1">0.2</span> <span class="pl-k">end</span> <span class="pl-c"><span class="pl-c">--</span> Carnwenhan LVL 80</span></td>
      </tr>
      <tr>
        <td id="L264" class="blob-num js-line-number" data-line-number="264"></td>
        <td id="LC264" class="blob-code blob-code-inner js-file-line">	<span class="pl-k">if</span> subweapon.<span class="pl-smi">id</span> <span class="pl-k">==</span> <span class="pl-c1">19089</span> <span class="pl-k">then</span> mult <span class="pl-k">=</span> mult <span class="pl-k">+</span> <span class="pl-c1">0.3</span> <span class="pl-k">end</span> <span class="pl-c"><span class="pl-c">--</span> Carnwenhan LVL 85</span></td>
      </tr>
      <tr>
        <td id="L265" class="blob-num js-line-number" data-line-number="265"></td>
        <td id="LC265" class="blob-code blob-code-inner js-file-line">	<span class="pl-k">if</span> subweapon.<span class="pl-smi">id</span> <span class="pl-k">==</span> <span class="pl-c1">19621</span> <span class="pl-k">or</span> subweapon.<span class="pl-smi">id</span> <span class="pl-k">==</span> <span class="pl-c1">19719</span> <span class="pl-k">then</span> mult <span class="pl-k">=</span> mult <span class="pl-k">+</span> <span class="pl-c1">0.4</span> <span class="pl-k">end</span> <span class="pl-c"><span class="pl-c">--</span> Carnwenhan LVL 90 | LVL 95</span></td>
      </tr>
      <tr>
        <td id="L266" class="blob-num js-line-number" data-line-number="266"></td>
        <td id="LC266" class="blob-code blob-code-inner js-file-line">	<span class="pl-k">if</span> subweapon.<span class="pl-smi">id</span> <span class="pl-k">==</span> <span class="pl-c1">19828</span> <span class="pl-k">or</span> subweapon.<span class="pl-smi">id</span> <span class="pl-k">==</span> <span class="pl-c1">19957</span> <span class="pl-k">or</span> subweapon.<span class="pl-smi">id</span> <span class="pl-k">==</span> <span class="pl-c1">20561</span> <span class="pl-k">or</span> subweapon.<span class="pl-smi">id</span> <span class="pl-k">==</span> <span class="pl-c1">20562</span> <span class="pl-k">or</span> subweapon.<span class="pl-smi">id</span> <span class="pl-k">==</span> <span class="pl-c1">20586</span> <span class="pl-k">then</span> mult <span class="pl-k">=</span> mult <span class="pl-k">+</span> <span class="pl-c1">0.5</span> <span class="pl-k">end</span> <span class="pl-c"><span class="pl-c">--</span> Carnwenhan LVL 99 - 119 AG</span></td>
      </tr>
      <tr>
        <td id="L267" class="blob-num js-line-number" data-line-number="267"></td>
        <td id="LC267" class="blob-code blob-code-inner js-file-line">	</td>
      </tr>
      <tr>
        <td id="L268" class="blob-num js-line-number" data-line-number="268"></td>
        <td id="LC268" class="blob-code blob-code-inner js-file-line">    <span class="pl-k">if</span> mainweapon.<span class="pl-smi">en</span> <span class="pl-k">==</span> <span class="pl-s"><span class="pl-pds">&quot;</span>Legato Dagger<span class="pl-pds">&quot;</span></span> <span class="pl-k">then</span> mult <span class="pl-k">=</span> mult <span class="pl-k">+</span> <span class="pl-c1">0.05</span> <span class="pl-k">end</span></td>
      </tr>
      <tr>
        <td id="L269" class="blob-num js-line-number" data-line-number="269"></td>
        <td id="LC269" class="blob-code blob-code-inner js-file-line">	<span class="pl-k">if</span> subweapon.<span class="pl-smi">en</span> <span class="pl-k">==</span> <span class="pl-s"><span class="pl-pds">&quot;</span>Legato Dagger<span class="pl-pds">&quot;</span></span> <span class="pl-k">then</span> mult <span class="pl-k">=</span> mult <span class="pl-k">+</span> <span class="pl-c1">0.05</span> <span class="pl-k">end</span></td>
      </tr>
      <tr>
        <td id="L270" class="blob-num js-line-number" data-line-number="270"></td>
        <td id="LC270" class="blob-code blob-code-inner js-file-line">	<span class="pl-k">if</span> mainweapon.<span class="pl-smi">en</span> <span class="pl-k">==</span> <span class="pl-s"><span class="pl-pds">&quot;</span>Kali<span class="pl-pds">&quot;</span></span> <span class="pl-k">then</span> mult <span class="pl-k">=</span> mult <span class="pl-k">+</span> <span class="pl-c1">0.05</span> <span class="pl-k">end</span></td>
      </tr>
      <tr>
        <td id="L271" class="blob-num js-line-number" data-line-number="271"></td>
        <td id="LC271" class="blob-code blob-code-inner js-file-line">	<span class="pl-k">if</span> subweapon.<span class="pl-smi">en</span> <span class="pl-k">==</span> <span class="pl-s"><span class="pl-pds">&quot;</span>Kali<span class="pl-pds">&quot;</span></span> <span class="pl-k">then</span> mult <span class="pl-k">=</span> mult <span class="pl-k">+</span> <span class="pl-c1">0.05</span> <span class="pl-k">end</span></td>
      </tr>
      <tr>
        <td id="L272" class="blob-num js-line-number" data-line-number="272"></td>
        <td id="LC272" class="blob-code blob-code-inner js-file-line">	<span class="pl-k">if</span> neck.<span class="pl-smi">en</span> <span class="pl-k">==</span> <span class="pl-s"><span class="pl-pds">&quot;</span>Aoidos&#39; Matinee<span class="pl-pds">&quot;</span></span> <span class="pl-k">then</span> mult <span class="pl-k">=</span> mult <span class="pl-k">+</span> <span class="pl-c1">0.1</span> <span class="pl-k">end</span></td>
      </tr>
      <tr>
        <td id="L273" class="blob-num js-line-number" data-line-number="273"></td>
        <td id="LC273" class="blob-code blob-code-inner js-file-line">	<span class="pl-k">if</span> neck.<span class="pl-smi">en</span> <span class="pl-k">==</span> <span class="pl-s"><span class="pl-pds">&quot;</span>Moonbow Whistle<span class="pl-pds">&quot;</span></span> <span class="pl-k">then</span> mult <span class="pl-k">=</span> mult <span class="pl-k">+</span> <span class="pl-c1">0.2</span> <span class="pl-k">end</span> </td>
      </tr>
      <tr>
        <td id="L274" class="blob-num js-line-number" data-line-number="274"></td>
        <td id="LC274" class="blob-code blob-code-inner js-file-line">	<span class="pl-k">if</span> neck.<span class="pl-smi">en</span> <span class="pl-k">==</span> <span class="pl-s"><span class="pl-pds">&quot;</span>Mnbw. Whistle +1<span class="pl-pds">&quot;</span></span> <span class="pl-k">then</span> mult <span class="pl-k">=</span> mult <span class="pl-k">+</span> <span class="pl-c1">0.2</span> <span class="pl-k">end</span> </td>
      </tr>
      <tr>
        <td id="L275" class="blob-num js-line-number" data-line-number="275"></td>
        <td id="LC275" class="blob-code blob-code-inner js-file-line">    <span class="pl-k">if</span> body.<span class="pl-smi">en</span> <span class="pl-k">==</span> <span class="pl-s"><span class="pl-pds">&quot;</span>Fili Hongreline +1<span class="pl-pds">&quot;</span></span> <span class="pl-k">then</span> mult <span class="pl-k">=</span> mult <span class="pl-k">+</span> <span class="pl-c1">0.12</span> <span class="pl-k">end</span></td>
      </tr>
      <tr>
        <td id="L276" class="blob-num js-line-number" data-line-number="276"></td>
        <td id="LC276" class="blob-code blob-code-inner js-file-line">	<span class="pl-k">if</span> body.<span class="pl-smi">en</span> <span class="pl-k">==</span> <span class="pl-s"><span class="pl-pds">&quot;</span>Aoidos&#39; Hngrln. +2<span class="pl-pds">&quot;</span></span> <span class="pl-k">then</span> mult <span class="pl-k">=</span> mult <span class="pl-k">+</span> <span class="pl-c1">0.1</span> <span class="pl-k">end</span></td>
      </tr>
      <tr>
        <td id="L277" class="blob-num js-line-number" data-line-number="277"></td>
        <td id="LC277" class="blob-code blob-code-inner js-file-line">	<span class="pl-k">if</span> body.<span class="pl-smi">en</span> <span class="pl-k">==</span> <span class="pl-s"><span class="pl-pds">&quot;</span>Aoidos&#39; Hngrln. +1<span class="pl-pds">&quot;</span></span> <span class="pl-k">then</span> mult <span class="pl-k">=</span> mult <span class="pl-k">+</span> <span class="pl-c1">0.05</span> <span class="pl-k">end</span></td>
      </tr>
      <tr>
        <td id="L278" class="blob-num js-line-number" data-line-number="278"></td>
        <td id="LC278" class="blob-code blob-code-inner js-file-line">	<span class="pl-k">if</span> legs.<span class="pl-smi">en</span> <span class="pl-k">==</span> <span class="pl-s"><span class="pl-pds">&quot;</span>Inyanga Shalwar<span class="pl-pds">&quot;</span></span> <span class="pl-k">then</span> mult <span class="pl-k">=</span> mult <span class="pl-k">+</span> <span class="pl-c1">0.12</span> <span class="pl-k">end</span></td>
      </tr>
      <tr>
        <td id="L279" class="blob-num js-line-number" data-line-number="279"></td>
        <td id="LC279" class="blob-code blob-code-inner js-file-line">	<span class="pl-k">if</span> legs.<span class="pl-smi">en</span> <span class="pl-k">==</span> <span class="pl-s"><span class="pl-pds">&quot;</span>Inyanga Shalwar +1<span class="pl-pds">&quot;</span></span> <span class="pl-k">then</span> mult <span class="pl-k">=</span> mult <span class="pl-k">+</span> <span class="pl-c1">0.15</span> <span class="pl-k">end</span></td>
      </tr>
      <tr>
        <td id="L280" class="blob-num js-line-number" data-line-number="280"></td>
        <td id="LC280" class="blob-code blob-code-inner js-file-line">	<span class="pl-k">if</span> legs.<span class="pl-smi">en</span> <span class="pl-k">==</span> <span class="pl-s"><span class="pl-pds">&quot;</span>Inyanga Shalwar +2<span class="pl-pds">&quot;</span></span> <span class="pl-k">then</span> mult <span class="pl-k">=</span> mult <span class="pl-k">+</span> <span class="pl-c1">0.17</span> <span class="pl-k">end</span></td>
      </tr>
      <tr>
        <td id="L281" class="blob-num js-line-number" data-line-number="281"></td>
        <td id="LC281" class="blob-code blob-code-inner js-file-line">	<span class="pl-k">if</span> legs.<span class="pl-smi">en</span> <span class="pl-k">==</span> <span class="pl-s"><span class="pl-pds">&quot;</span>Mdk. Shalwar +1<span class="pl-pds">&quot;</span></span> <span class="pl-k">then</span> mult <span class="pl-k">=</span> mult <span class="pl-k">+</span> <span class="pl-c1">0.1</span> <span class="pl-k">end</span></td>
      </tr>
      <tr>
        <td id="L282" class="blob-num js-line-number" data-line-number="282"></td>
        <td id="LC282" class="blob-code blob-code-inner js-file-line">	<span class="pl-k">if</span> feet.<span class="pl-smi">en</span> <span class="pl-k">==</span> <span class="pl-s"><span class="pl-pds">&quot;</span>Brioso Slippers<span class="pl-pds">&quot;</span></span> <span class="pl-k">then</span> mult <span class="pl-k">=</span> mult <span class="pl-k">+</span> <span class="pl-c1">0.1</span> <span class="pl-k">end</span></td>
      </tr>
      <tr>
        <td id="L283" class="blob-num js-line-number" data-line-number="283"></td>
        <td id="LC283" class="blob-code blob-code-inner js-file-line">    <span class="pl-k">if</span> feet.<span class="pl-smi">en</span> <span class="pl-k">==</span> <span class="pl-s"><span class="pl-pds">&quot;</span>Brioso Slippers +1<span class="pl-pds">&quot;</span></span> <span class="pl-k">then</span> mult <span class="pl-k">=</span> mult <span class="pl-k">+</span> <span class="pl-c1">0.11</span> <span class="pl-k">end</span></td>
      </tr>
      <tr>
        <td id="L284" class="blob-num js-line-number" data-line-number="284"></td>
        <td id="LC284" class="blob-code blob-code-inner js-file-line">	<span class="pl-k">if</span> feet.<span class="pl-smi">en</span> <span class="pl-k">==</span> <span class="pl-s"><span class="pl-pds">&quot;</span>Brioso Slippers +2<span class="pl-pds">&quot;</span></span> <span class="pl-k">then</span> mult <span class="pl-k">=</span> mult <span class="pl-k">+</span> <span class="pl-c1">0.13</span> <span class="pl-k">end</span></td>
      </tr>
      <tr>
        <td id="L285" class="blob-num js-line-number" data-line-number="285"></td>
        <td id="LC285" class="blob-code blob-code-inner js-file-line">	<span class="pl-k">if</span> feet.<span class="pl-smi">en</span> <span class="pl-k">==</span> <span class="pl-s"><span class="pl-pds">&quot;</span>Brioso Slippers +3<span class="pl-pds">&quot;</span></span> <span class="pl-k">then</span> mult <span class="pl-k">=</span> mult <span class="pl-k">+</span> <span class="pl-c1">0.15</span> <span class="pl-k">end</span></td>
      </tr>
      <tr>
        <td id="L286" class="blob-num js-line-number" data-line-number="286"></td>
        <td id="LC286" class="blob-code blob-code-inner js-file-line">	<span class="pl-k">if</span> hands.<span class="pl-smi">en</span> <span class="pl-k">==</span> <span class="pl-s"><span class="pl-pds">&#39;</span>Brioso Cuffs +1<span class="pl-pds">&#39;</span></span> <span class="pl-k">then</span> mult <span class="pl-k">=</span> mult <span class="pl-k">+</span> <span class="pl-c1">0.1</span> <span class="pl-k">end</span></td>
      </tr>
      <tr>
        <td id="L287" class="blob-num js-line-number" data-line-number="287"></td>
        <td id="LC287" class="blob-code blob-code-inner js-file-line">	<span class="pl-k">if</span> hands.<span class="pl-smi">en</span> <span class="pl-k">==</span> <span class="pl-s"><span class="pl-pds">&#39;</span>Brioso Cuffs +2<span class="pl-pds">&#39;</span></span> <span class="pl-k">then</span> mult <span class="pl-k">=</span> mult <span class="pl-k">+</span> <span class="pl-c1">0.1</span> <span class="pl-k">end</span></td>
      </tr>
      <tr>
        <td id="L288" class="blob-num js-line-number" data-line-number="288"></td>
        <td id="LC288" class="blob-code blob-code-inner js-file-line">	<span class="pl-k">if</span> hands.<span class="pl-smi">en</span> <span class="pl-k">==</span> <span class="pl-s"><span class="pl-pds">&#39;</span>Brioso Cuffs +3<span class="pl-pds">&#39;</span></span> <span class="pl-k">then</span> mult <span class="pl-k">=</span> mult <span class="pl-k">+</span> <span class="pl-c1">0.2</span> <span class="pl-k">end</span></td>
      </tr>
      <tr>
        <td id="L289" class="blob-num js-line-number" data-line-number="289"></td>
        <td id="LC289" class="blob-code blob-code-inner js-file-line">    </td>
      </tr>
      <tr>
        <td id="L290" class="blob-num js-line-number" data-line-number="290"></td>
        <td id="LC290" class="blob-code blob-code-inner js-file-line">	</td>
      </tr>
      <tr>
        <td id="L291" class="blob-num js-line-number" data-line-number="291"></td>
        <td id="LC291" class="blob-code blob-code-inner js-file-line">	<span class="pl-k">if</span> <span class="pl-c1">self</span>.<span class="pl-smi">job_points</span>.<span class="pl-smi">brd</span>.<span class="pl-smi">jp_spent</span> <span class="pl-k">&gt;=</span> <span class="pl-c1">1200</span> <span class="pl-k">then</span></td>
      </tr>
      <tr>
        <td id="L292" class="blob-num js-line-number" data-line-number="292"></td>
        <td id="LC292" class="blob-code blob-code-inner js-file-line">		mult <span class="pl-k">=</span> mult <span class="pl-k">+</span> <span class="pl-c1">0.05</span></td>
      </tr>
      <tr>
        <td id="L293" class="blob-num js-line-number" data-line-number="293"></td>
        <td id="LC293" class="blob-code blob-code-inner js-file-line">	<span class="pl-k">end</span></td>
      </tr>
      <tr>
        <td id="L294" class="blob-num js-line-number" data-line-number="294"></td>
        <td id="LC294" class="blob-code blob-code-inner js-file-line">		</td>
      </tr>
      <tr>
        <td id="L295" class="blob-num js-line-number" data-line-number="295"></td>
        <td id="LC295" class="blob-code blob-code-inner js-file-line">    <span class="pl-k">if</span> troubadour <span class="pl-k">then</span></td>
      </tr>
      <tr>
        <td id="L296" class="blob-num js-line-number" data-line-number="296"></td>
        <td id="LC296" class="blob-code blob-code-inner js-file-line">        mult <span class="pl-k">=</span> mult<span class="pl-k">*</span><span class="pl-c1">2</span></td>
      </tr>
      <tr>
        <td id="L297" class="blob-num js-line-number" data-line-number="297"></td>
        <td id="LC297" class="blob-code blob-code-inner js-file-line">    <span class="pl-k">end</span></td>
      </tr>
      <tr>
        <td id="L298" class="blob-num js-line-number" data-line-number="298"></td>
        <td id="LC298" class="blob-code blob-code-inner js-file-line">    </td>
      </tr>
      <tr>
        <td id="L299" class="blob-num js-line-number" data-line-number="299"></td>
        <td id="LC299" class="blob-code blob-code-inner js-file-line">	<span class="pl-k">if</span> spell.<span class="pl-smi">en</span> <span class="pl-k">==</span> <span class="pl-s"><span class="pl-pds">&quot;</span>Foe Lullaby II<span class="pl-pds">&quot;</span></span> <span class="pl-k">or</span> spell.<span class="pl-smi">en</span> <span class="pl-k">==</span> <span class="pl-s"><span class="pl-pds">&quot;</span>Horde Lullaby II<span class="pl-pds">&quot;</span></span> <span class="pl-k">then</span> </td>
      </tr>
      <tr>
        <td id="L300" class="blob-num js-line-number" data-line-number="300"></td>
        <td id="LC300" class="blob-code blob-code-inner js-file-line">		base <span class="pl-k">=</span> <span class="pl-c1">60</span></td>
      </tr>
      <tr>
        <td id="L301" class="blob-num js-line-number" data-line-number="301"></td>
        <td id="LC301" class="blob-code blob-code-inner js-file-line">	<span class="pl-k">elseif</span> spell.<span class="pl-smi">en</span> <span class="pl-k">==</span> <span class="pl-s"><span class="pl-pds">&quot;</span>Foe Lullaby<span class="pl-pds">&quot;</span></span> <span class="pl-k">or</span> spell.<span class="pl-smi">en</span> <span class="pl-k">==</span> <span class="pl-s"><span class="pl-pds">&quot;</span>Horde Lullaby<span class="pl-pds">&quot;</span></span> <span class="pl-k">then</span> </td>
      </tr>
      <tr>
        <td id="L302" class="blob-num js-line-number" data-line-number="302"></td>
        <td id="LC302" class="blob-code blob-code-inner js-file-line">		base <span class="pl-k">=</span> <span class="pl-c1">30</span></td>
      </tr>
      <tr>
        <td id="L303" class="blob-num js-line-number" data-line-number="303"></td>
        <td id="LC303" class="blob-code blob-code-inner js-file-line">	<span class="pl-k">end</span></td>
      </tr>
      <tr>
        <td id="L304" class="blob-num js-line-number" data-line-number="304"></td>
        <td id="LC304" class="blob-code blob-code-inner js-file-line">	</td>
      </tr>
      <tr>
        <td id="L305" class="blob-num js-line-number" data-line-number="305"></td>
        <td id="LC305" class="blob-code blob-code-inner js-file-line">	totalDuration <span class="pl-k">=</span> <span class="pl-c1">math.floor</span>(mult<span class="pl-k">*</span>base)		</td>
      </tr>
      <tr>
        <td id="L306" class="blob-num js-line-number" data-line-number="306"></td>
        <td id="LC306" class="blob-code blob-code-inner js-file-line">	</td>
      </tr>
      <tr>
        <td id="L307" class="blob-num js-line-number" data-line-number="307"></td>
        <td id="LC307" class="blob-code blob-code-inner js-file-line">	<span class="pl-c"><span class="pl-c">--</span> Job Points Buff</span></td>
      </tr>
      <tr>
        <td id="L308" class="blob-num js-line-number" data-line-number="308"></td>
        <td id="LC308" class="blob-code blob-code-inner js-file-line">	totalDuration <span class="pl-k">=</span> totalDuration <span class="pl-k">+</span> <span class="pl-c1">self</span>.<span class="pl-smi">job_points</span>.<span class="pl-smi">brd</span>.<span class="pl-smi">lullaby_duration</span></td>
      </tr>
      <tr>
        <td id="L309" class="blob-num js-line-number" data-line-number="309"></td>
        <td id="LC309" class="blob-code blob-code-inner js-file-line">	<span class="pl-k">if</span> troubadour <span class="pl-k">then</span> </td>
      </tr>
      <tr>
        <td id="L310" class="blob-num js-line-number" data-line-number="310"></td>
        <td id="LC310" class="blob-code blob-code-inner js-file-line">		totalDuration <span class="pl-k">=</span> totalDuration <span class="pl-k">+</span> <span class="pl-c1">self</span>.<span class="pl-smi">job_points</span>.<span class="pl-smi">brd</span>.<span class="pl-smi">lullaby_duration</span> <span class="pl-c"><span class="pl-c">--</span> adding it a second time if Troubadour up</span></td>
      </tr>
      <tr>
        <td id="L311" class="blob-num js-line-number" data-line-number="311"></td>
        <td id="LC311" class="blob-code blob-code-inner js-file-line">	<span class="pl-k">end</span></td>
      </tr>
      <tr>
        <td id="L312" class="blob-num js-line-number" data-line-number="312"></td>
        <td id="LC312" class="blob-code blob-code-inner js-file-line">	</td>
      </tr>
      <tr>
        <td id="L313" class="blob-num js-line-number" data-line-number="313"></td>
        <td id="LC313" class="blob-code blob-code-inner js-file-line">	<span class="pl-k">if</span> clarioncall <span class="pl-k">then</span></td>
      </tr>
      <tr>
        <td id="L314" class="blob-num js-line-number" data-line-number="314"></td>
        <td id="LC314" class="blob-code blob-code-inner js-file-line">		<span class="pl-k">if</span> troubadour <span class="pl-k">then</span> </td>
      </tr>
      <tr>
        <td id="L315" class="blob-num js-line-number" data-line-number="315"></td>
        <td id="LC315" class="blob-code blob-code-inner js-file-line">			totalDuration <span class="pl-k">=</span> totalDuration <span class="pl-k">+</span> (<span class="pl-c1">self</span>.<span class="pl-smi">job_points</span>.<span class="pl-smi">brd</span>.<span class="pl-smi">clarion_call_effect</span> <span class="pl-k">*</span> <span class="pl-c1">2</span> <span class="pl-k">*</span> <span class="pl-c1">2</span>) <span class="pl-c"><span class="pl-c">--</span> Clarion Call gives 2 seconds per Job Point upgrade.  * 2 again for Troubadour</span></td>
      </tr>
      <tr>
        <td id="L316" class="blob-num js-line-number" data-line-number="316"></td>
        <td id="LC316" class="blob-code blob-code-inner js-file-line">		<span class="pl-k">else</span></td>
      </tr>
      <tr>
        <td id="L317" class="blob-num js-line-number" data-line-number="317"></td>
        <td id="LC317" class="blob-code blob-code-inner js-file-line">			totalDuration <span class="pl-k">=</span> totalDuration <span class="pl-k">+</span> (<span class="pl-c1">self</span>.<span class="pl-smi">job_points</span>.<span class="pl-smi">brd</span>.<span class="pl-smi">clarion_call_effect</span> <span class="pl-k">*</span> <span class="pl-c1">2</span>)  <span class="pl-c"><span class="pl-c">--</span> Clarion Call gives 2 seconds per Job Point upgrade. </span></td>
      </tr>
      <tr>
        <td id="L318" class="blob-num js-line-number" data-line-number="318"></td>
        <td id="LC318" class="blob-code blob-code-inner js-file-line">		<span class="pl-k">end</span></td>
      </tr>
      <tr>
        <td id="L319" class="blob-num js-line-number" data-line-number="319"></td>
        <td id="LC319" class="blob-code blob-code-inner js-file-line">	<span class="pl-k">end</span></td>
      </tr>
      <tr>
        <td id="L320" class="blob-num js-line-number" data-line-number="320"></td>
        <td id="LC320" class="blob-code blob-code-inner js-file-line">	</td>
      </tr>
      <tr>
        <td id="L321" class="blob-num js-line-number" data-line-number="321"></td>
        <td id="LC321" class="blob-code blob-code-inner js-file-line">	<span class="pl-k">if</span> marcato <span class="pl-k">and</span> <span class="pl-k">not</span> soulvoice <span class="pl-k">then</span></td>
      </tr>
      <tr>
        <td id="L322" class="blob-num js-line-number" data-line-number="322"></td>
        <td id="LC322" class="blob-code blob-code-inner js-file-line">		totalDuration <span class="pl-k">=</span> totalDuration <span class="pl-k">+</span> <span class="pl-c1">self</span>.<span class="pl-smi">job_points</span>.<span class="pl-smi">brd</span>.<span class="pl-smi">marcato_effect</span></td>
      </tr>
      <tr>
        <td id="L323" class="blob-num js-line-number" data-line-number="323"></td>
        <td id="LC323" class="blob-code blob-code-inner js-file-line">	<span class="pl-k">end</span></td>
      </tr>
      <tr>
        <td id="L324" class="blob-num js-line-number" data-line-number="324"></td>
        <td id="LC324" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L325" class="blob-num js-line-number" data-line-number="325"></td>
        <td id="LC325" class="blob-code blob-code-inner js-file-line">	<span class="pl-c"><span class="pl-c">--</span> print(totalDuration,&#39;cc&#39;,clarioncall,&#39;tr&#39;,troubadour,&#39;troubGain&#39;,troubMeritGain,&#39;mult&#39;,mult)</span></td>
      </tr>
      <tr>
        <td id="L326" class="blob-num js-line-number" data-line-number="326"></td>
        <td id="LC326" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L327" class="blob-num js-line-number" data-line-number="327"></td>
        <td id="LC327" class="blob-code blob-code-inner js-file-line">    <span class="pl-k">return</span> totalDuration</td>
      </tr>
      <tr>
        <td id="L328" class="blob-num js-line-number" data-line-number="328"></td>
        <td id="LC328" class="blob-code blob-code-inner js-file-line"><span class="pl-k">end</span></td>
      </tr>
</table>

  <details class="details-reset details-overlay BlobToolbar position-absolute js-file-line-actions dropdown d-none" aria-hidden="true">
    <summary class="btn-octicon ml-0 px-2 p-0 bg-white border border-gray-dark rounded-1" aria-label="Inline file action toolbar">
      <svg class="octicon octicon-kebab-horizontal" viewBox="0 0 13 16" version="1.1" width="13" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M1.5 9a1.5 1.5 0 100-3 1.5 1.5 0 000 3zm5 0a1.5 1.5 0 100-3 1.5 1.5 0 000 3zM13 7.5a1.5 1.5 0 11-3 0 1.5 1.5 0 013 0z"></path></svg>
    </summary>
    <details-menu>
      <ul class="BlobToolbar-dropdown dropdown-menu dropdown-menu-se mt-2" style="width:185px">
        <li>
          <clipboard-copy role="menuitem" class="dropdown-item" id="js-copy-lines" style="cursor:pointer;">
            Copy lines
          </clipboard-copy>
        </li>
        <li>
          <clipboard-copy role="menuitem" class="dropdown-item" id="js-copy-permalink" style="cursor:pointer;">
            Copy permalink
          </clipboard-copy>
        </li>
        <li><a class="dropdown-item js-update-url-with-hash" id="js-view-git-blame" role="menuitem" href="/SammehFFXI/FFXIAddons/blame/1bbf85843fbbd39ff665ae58e4621732e7d69178/Sleeper/sleeper.lua">View git blame</a></li>
          <li><a class="dropdown-item" id="js-new-issue" role="menuitem" href="/SammehFFXI/FFXIAddons/issues/new">Reference in new issue</a></li>
      </ul>
    </details-menu>
  </details>

  </div>

    </div>

  

  <details class="details-reset details-overlay details-overlay-dark">
    <summary data-hotkey="l" aria-label="Jump to line"></summary>
    <details-dialog class="Box Box--overlay d-flex flex-column anim-fade-in fast linejump" aria-label="Jump to line">
      <!-- '"` --><!-- </textarea></xmp> --></option></form><form class="js-jump-to-line-form Box-body d-flex" action="" accept-charset="UTF-8" method="get">
        <input class="form-control flex-auto mr-3 linejump-input js-jump-to-line-field" type="text" placeholder="Jump to line&hellip;" aria-label="Jump to line" autofocus>
        <button type="submit" class="btn" data-close-dialog>Go</button>
</form>    </details-dialog>
  </details>



  </div>
</div>

    </main>
  </div>
  

  </div>

        
<div class="footer container-lg width-full p-responsive" role="contentinfo">
  <div class="position-relative d-flex flex-row-reverse flex-lg-row flex-wrap flex-lg-nowrap flex-justify-center flex-lg-justify-between pt-6 pb-2 mt-6 f6 text-gray border-top border-gray-light ">
    <ul class="list-style-none d-flex flex-wrap col-12 col-lg-5 flex-justify-center flex-lg-justify-between mb-2 mb-lg-0">
      <li class="mr-3 mr-lg-0">&copy; 2020 GitHub, Inc.</li>
        <li class="mr-3 mr-lg-0"><a data-ga-click="Footer, go to terms, text:terms" href="https://github.com/site/terms">Terms</a></li>
        <li class="mr-3 mr-lg-0"><a data-ga-click="Footer, go to privacy, text:privacy" href="https://github.com/site/privacy">Privacy</a></li>
        <li class="mr-3 mr-lg-0"><a data-ga-click="Footer, go to security, text:security" href="https://github.com/security">Security</a></li>
        <li class="mr-3 mr-lg-0"><a href="https://githubstatus.com/" data-ga-click="Footer, go to status, text:status">Status</a></li>
        <li><a data-ga-click="Footer, go to help, text:help" href="https://help.github.com">Help</a></li>

    </ul>

    <a aria-label="Homepage" title="GitHub" class="footer-octicon d-none d-lg-block mx-lg-4" href="https://github.com">
      <svg height="24" class="octicon octicon-mark-github" viewBox="0 0 16 16" version="1.1" width="24" aria-hidden="true"><path fill-rule="evenodd" d="M8 0C3.58 0 0 3.58 0 8c0 3.54 2.29 6.53 5.47 7.59.4.07.55-.17.55-.38 0-.19-.01-.82-.01-1.49-2.01.37-2.53-.49-2.69-.94-.09-.23-.48-.94-.82-1.13-.28-.15-.68-.52-.01-.53.63-.01 1.08.58 1.23.82.72 1.21 1.87.87 2.33.66.07-.52.28-.87.51-1.07-1.78-.2-3.64-.89-3.64-3.95 0-.87.31-1.59.82-2.15-.08-.2-.36-1.02.08-2.12 0 0 .67-.21 2.2.82.64-.18 1.32-.27 2-.27.68 0 1.36.09 2 .27 1.53-1.04 2.2-.82 2.2-.82.44 1.1.16 1.92.08 2.12.51.56.82 1.27.82 2.15 0 3.07-1.87 3.75-3.65 3.95.29.25.54.73.54 1.48 0 1.07-.01 1.93-.01 2.2 0 .21.15.46.55.38A8.013 8.013 0 0016 8c0-4.42-3.58-8-8-8z"></path></svg>
</a>
   <ul class="list-style-none d-flex flex-wrap col-12 col-lg-5 flex-justify-center flex-lg-justify-between mb-2 mb-lg-0">
        <li class="mr-3 mr-lg-0"><a data-ga-click="Footer, go to contact, text:contact" href="https://github.com/contact">Contact GitHub</a></li>
        <li class="mr-3 mr-lg-0"><a href="https://github.com/pricing" data-ga-click="Footer, go to Pricing, text:Pricing">Pricing</a></li>
      <li class="mr-3 mr-lg-0"><a href="https://developer.github.com" data-ga-click="Footer, go to api, text:api">API</a></li>
      <li class="mr-3 mr-lg-0"><a href="https://training.github.com" data-ga-click="Footer, go to training, text:training">Training</a></li>
        <li class="mr-3 mr-lg-0"><a href="https://github.blog" data-ga-click="Footer, go to blog, text:blog">Blog</a></li>
        <li><a data-ga-click="Footer, go to about, text:about" href="https://github.com/about">About</a></li>
    </ul>
  </div>
  <div class="d-flex flex-justify-center pb-6">
    <span class="f6 text-gray-light"></span>
  </div>
</div>



  <div id="ajax-error-message" class="ajax-error-message flash flash-error">
    <svg class="octicon octicon-alert" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M8.893 1.5c-.183-.31-.52-.5-.887-.5s-.703.19-.886.5L.138 13.499a.98.98 0 000 1.001c.193.31.53.501.886.501h13.964c.367 0 .704-.19.877-.5a1.03 1.03 0 00.01-1.002L8.893 1.5zm.133 11.497H6.987v-2.003h2.039v2.003zm0-3.004H6.987V5.987h2.039v4.006z"></path></svg>
    <button type="button" class="flash-close js-ajax-error-dismiss" aria-label="Dismiss error">
      <svg class="octicon octicon-x" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M7.48 8l3.75 3.75-1.48 1.48L6 9.48l-3.75 3.75-1.48-1.48L4.52 8 .77 4.25l1.48-1.48L6 6.52l3.75-3.75 1.48 1.48L7.48 8z"></path></svg>
    </button>
    You can’t perform that action at this time.
  </div>


    <script crossorigin="anonymous" async="async" integrity="sha512-WcQmT2vhcClFVOaaAJV/M+HqsJ2Gq/myvl6F3gCVBxykazXTs+i5fvxncSXwyG1CSfcrqmLFw/R/bmFYzprX2A==" type="application/javascript" id="js-conditional-compat" data-src="https://github.githubassets.com/assets/compat-bootstrap-59c4264f.js"></script>
    <script crossorigin="anonymous" integrity="sha512-Qb7XHcWIafGt8U6FsJrxJqGCgszwjKK1zXv1+fAjIz0HDaYppswlGLxEInNMN2dlMBAZnZNSZL8wAvvhKxYx3A==" type="application/javascript" src="https://github.githubassets.com/assets/environment-bootstrap-41bed71d.js"></script>
    <script crossorigin="anonymous" async="async" integrity="sha512-327XCyOytNBlvvFRes7NYmY/gSME67CreRw+pR2DhNKBfEb2Sv0pe/XkZUSqYYlgGdDnaGIKUAb4oRZBLdKBfw==" type="application/javascript" src="https://github.githubassets.com/assets/vendor-df6ed70b.js"></script>
    <script crossorigin="anonymous" async="async" integrity="sha512-eXpQLpAhVAJMHk7Z0KCmLWkovVfHkwsEb7RddC/hfCt62wuVC8JAZUWiTeScadRGkJBFX6UxgmrE/uhItlLvqA==" type="application/javascript" src="https://github.githubassets.com/assets/frameworks-797a502e.js"></script>
    
    <script crossorigin="anonymous" async="async" integrity="sha512-OTqsM4mraYzULmlz+LZdJRtsSJ+Hg3GGkXxl9kQa3iIJVmLmHParygkIZrqbnIY9Fpju2Z0gHzF0joFNuuO7gA==" type="application/javascript" src="https://github.githubassets.com/assets/github-bootstrap-393aac33.js"></script>
    
    
    
  <div class="js-stale-session-flash flash flash-warn flash-banner" hidden
    >
    <svg class="octicon octicon-alert" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M8.893 1.5c-.183-.31-.52-.5-.887-.5s-.703.19-.886.5L.138 13.499a.98.98 0 000 1.001c.193.31.53.501.886.501h13.964c.367 0 .704-.19.877-.5a1.03 1.03 0 00.01-1.002L8.893 1.5zm.133 11.497H6.987v-2.003h2.039v2.003zm0-3.004H6.987V5.987h2.039v4.006z"></path></svg>
    <span class="js-stale-session-flash-signed-in" hidden>You signed in with another tab or window. <a href="">Reload</a> to refresh your session.</span>
    <span class="js-stale-session-flash-signed-out" hidden>You signed out in another tab or window. <a href="">Reload</a> to refresh your session.</span>
  </div>
  <template id="site-details-dialog">
  <details class="details-reset details-overlay details-overlay-dark lh-default text-gray-dark hx_rsm" open>
    <summary role="button" aria-label="Close dialog"></summary>
    <details-dialog class="Box Box--overlay d-flex flex-column anim-fade-in fast hx_rsm-dialog hx_rsm-modal">
      <button class="Box-btn-octicon m-0 btn-octicon position-absolute right-0 top-0" type="button" aria-label="Close dialog" data-close-dialog>
        <svg class="octicon octicon-x" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M7.48 8l3.75 3.75-1.48 1.48L6 9.48l-3.75 3.75-1.48-1.48L4.52 8 .77 4.25l1.48-1.48L6 6.52l3.75-3.75 1.48 1.48L7.48 8z"></path></svg>
      </button>
      <div class="octocat-spinner my-6 js-details-dialog-spinner"></div>
    </details-dialog>
  </details>
</template>

  <div class="Popover js-hovercard-content position-absolute" style="display: none; outline: none;" tabindex="0">
  <div class="Popover-message Popover-message--bottom-left Popover-message--large Box box-shadow-large" style="width:360px;">
  </div>
</div>


  </body>
</html>

