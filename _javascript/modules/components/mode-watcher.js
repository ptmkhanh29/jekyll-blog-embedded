/**
 * Add listener for theme mode toggle
 */
/*const $toggleElem = $('.mode');

export function modeWatcher() {
  if ($toggleElem.length === 0) {
    return;
  }

  $toggleElem.off().on('click', (e) => {
    const $target = $(e.target);
    let $btn =
      $target.prop('tagName') === 'button'.toUpperCase()
        ? $target
        : $target.parent();

    modeToggle.flipMode(); // modeToggle: `_includes/mode-toggle.html`
    $btn.trigger('blur'); // remove the clicking outline
  });
}*/
$(document).ready(function() {
  // Đường dẫn đến hình ảnh mặt trời và mặt trăng của bạn
  const sunImgPath = 'assets/img/favicons/sun.png';
  const moonImgPath = 'assets/img/favicons/moon.png';

  function updateIcon() {
    // Kiểm tra xem thẻ <html> có attribute 'data-mode' không
    if ($('html').is('[data-mode]')) {
      // Nếu có, kiểm tra tiếp xem nó có phải là 'dark'
      if ($('html').attr('data-mode') === 'dark') {
        // Nếu có, hiển thị hình ảnh mặt trăng
        $('#toggle-icon').attr('src', sunImgPath);
      }
    } else {
      // Nếu không có attribute 'data-mode', hiển thị hình ảnh mặt trời
      $('#toggle-icon').attr('src', moonImgPath);
    }
  }

  // Cập nhật icon ngay khi trang được tải
  updateIcon();
});






