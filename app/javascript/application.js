// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import PullToRefresh from 'pulltorefreshjs';

PullToRefresh.init({
  mainElement: 'body',
  onRefresh() {
    window.location.reload();
  }
});

document.addEventListener('turbo:before-fetch-request', async (event) => {
  event.detail.fetchOptions.headers['X-TimeZone'] = Intl.DateTimeFormat().resolvedOptions().timeZone;
})
