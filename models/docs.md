{% docs source_relation %}
The source of the record if the unioning functionality is being used. If not this field will be empty.
{% enddocs %}

{% docs conversions %}
Total installs resulting from a view or a tap. This field was deprecated in [February 2025](https://fivetran.com/docs/changelog/2025/february-2025#applesearchads) due to the release of Apple Search Ads API v5 and replaced with `tap_installs`.  We will completely sunset this field from the package by April 2025.
{% enddocs %}

{% docs new_downloads %}
App downloads from new users who have never before installed the respective app. This field was deprecated in [February 2025](https://fivetran.com/docs/changelog/2025/february-2025#applesearchads) due to the release of Apple Search Ads API v5 and replaced with `tap_new_downloads`.  We will completely sunset this field from the package by April 2025.
{% enddocs %}

{% docs redownloads %}
Occurs when a user downloads respective app, deletes it, and downloads the same app again following a tap on an ad on the App Store, or downloads the same app to an additional device. This field was deprecated in [February 2025](https://fivetran.com/docs/changelog/2025/february-2025#applesearchads) due to the release of Apple Search Ads API v5 and replaced with `tap_redownloads`.  We will completely sunset this field from the package by April 2025.
{% enddocs %}

{% docs tap_installs %}
The total number of new downloads and redownloads from users who tapped on your ad within a 30-day window. This field was introduced in [February 2025](https://fivetran.com/docs/changelog/2025/february-2025#applesearchads) as part of the Apple Search Ads v5 API release. It has replaced the `conversions` field.
{% enddocs %}

{% docs tap_new_downloads %}
New downloads from users who tapped on your ad and have not previously downloaded your app. These are counted within a 30-day window. This field was introduced in [February 2025](https://fivetran.com/docs/changelog/2025/february-2025#applesearchads) as part of the Apple Search Ads v5 API release. It has replaced the `new_downloads` field.
{% enddocs %}

{% docs tap_redownloads %}
A redownload is when a user downloads your app, deletes it, then downloads it again on the same device or a different one following an ad tap. A tap-through redownload is counted when a user redownloads your app within 30 days of tapping on the ad. This field was introduced in [February 2025](https://fivetran.com/docs/changelog/2025/february-2025#applesearchads) as part of the Apple Search Ads v5 API release. It has replaced the `redownloads` field.
{% enddocs %}
