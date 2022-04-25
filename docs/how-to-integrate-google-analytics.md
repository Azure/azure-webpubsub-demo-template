# How to Integrate Google Analytics

## Official Documentation

[doc](https://developers.google.com/tag-platform/gtagjs/configure)

## Report management

> contact jixin to get access

[report](https://analytics.google.com/analytics/web/#/p277933550/reports/intelligenthome)

## Initialize Google Analytics

Add the following to `<head>` tag. [View sample here](https://github.com/Azure/azure-webpubsub/blob/8abb6fab77454011a80a235873be92900613147a/docs/demos/clientpubsub.html#L14).

``` html
    <!-- Global site tag (gtag.js) - Google Analytics -->
    <script async src="https://www.googletagmanager.com/gtag/js?id=G-5LSB8YMW7Y"></script>
    <script>
        window.dataLayer = window.dataLayer || [];
        function gtag() { dataLayer.push(arguments); }
        gtag('js', new Date());
        gtag('config', 'G-5LSB8YMW7Y');
    </script>

```

## Send Data to Google Analytics

### How to Decide When Should I Send Data to Google Analytics

**Only send actions triggered by visitors, or errors. NO customer content involves**.

e.g. In scoreboard demo, the visitor visit the page, trigger to establish to AWPS, so we **SHOULD** send data to google analytics. But messages sending in the scoreboard is auto generated, so do **NOT** send data to google analytics.

### How to send data

Add following to your js script. [View sample here](https://github.com/Azure/azure-webpubsub/blob/8abb6fab77454011a80a235873be92900613147a/docs/demos/clientpubsub.html#L241).

`gtag('event', '<EventName>', {method: '<MethodName>'});`

### Custom methods

The event names/method names are used to analyze the visitors behavior. Please try your best to **REUSE** the existing methods.

**If you want to add a new one, please contact yulinshi@microsoft.com first.** Recommend to use the [recommended events](https://developers.google.com/tag-platform/gtagjs/reference/events) first.

Once you decide to add a new event name/method name, please add a new item below to make it visible to others.

| Event Name | Method Name | Explanation | Notes | JavaScript Sample |
| --- | --- | --- | --- | --- |
| user\_acticity | connect | Connection start to connect |   | var websocket = client.connection = new WebSocket(markedEndpoint, &#39;json.webpubsub.azure.v1&#39;);gtag(&#39;event&#39;, &#39;user\_activity&#39;, {    method: &#39;connect&#39;}); |
| user\_acticity | ?subprotocol | Subprotocol of the connection | Add subprotocol in description | var websocket = client.connection = new WebSocket(markedEndpoint, &#39;json.webpubsub.azure.v1&#39;);gtag(&#39;event&#39;, &#39;user\_activity&#39;, {    method: &#39;subprotocol&#39;,    subprotocol: subprotocol}); |
| user\_acticity | connected | Connection is connected |   | websocket.onopen = e =\&gt; { …    gtag(&#39;event&#39;, &#39;user\_activity&#39;, {        method: &#39;connected&#39;    });}; |
| user\_acticity | joinGroup | Start to join group |   | gtag(&#39;event&#39;, &#39;user\_activity&#39;, {    method: &#39;joinGroup&#39;}); |
| user\_acticity | sendGroup | Start to send messages to s group |   | gtag(&#39;event&#39;, &#39;user\_activity&#39;, {    method: &#39;sendToGroup&#39;}); |
| exception |   | Exception on Connection drop | Add error details in description | websocket.onclose = e =\&gt; {    this.connected = false;    gtag(&#39;event&#39;, &#39;exception&#39;, {        description: `Client WebSocket closed. Type: ${e.type}, code: ${e.code}, reason: ${e.reason}, wasClean: ${e.wasClean}.`,        fatal: true    });}; |

**Todo: add js sample link**

**Todo: add more methods**