"use strict";

/**
 * @property {Object} settings Объект с настройками галереи.
 * @property {string} settings.previewSelector Селектор обертки для миниатюр галереи.
 * @property {string} settings.openedImageWrapperClass Класс для обертки открытой картинки.
 * @property {string} settings.openedImageClass Класс открытой картинки.
 * @property {string} settings.openedImageScreenClass Класс для ширмы открытой картинки.
 * @property {string} settings.openedImageCloseBtnClass Класс для картинки кнопки закрыть.
 * @property {string} settings.openedImageCloseBtnSrc Путь до картинки кнопки открыть.
 */
const gallery = {
  settings: {
    previewSelector: '.mySuperGallery',
    openedImagePrevButtonClass: 'galleryWrapper__prev',
    openedImagePrevButtonSrc: 'images/gallery/arrow-left.png',
    openedImageNextButtonClass: 'galleryWrapper__next',
    openedImageNextButtonSrc: 'images/gallery/arrow-right.png',
    openedImageWrapperClass: 'galleryWrapper',
    openedImageClass: 'galleryWrapper__image',
    openedImageScreenClass: 'galleryWrapper__screen',
    openedImageCloseBtnClass: 'galleryWrapper__close',
    openedImageCloseBtnSrc: 'images/gallery/close.png',
    openedImageErr404: 'images/gallery/404.jpg',
    viewsIconClass: 'viewsIcon__container',
  },
  views: '',

  activeBigImage: {},

  /**
   * Инициализирует галерею, ставит обработчик события.
   * @param {Object} userSettings Объект настроек для галереи.
   */
  init(userSettings = {}) {
    // Записываем настройки, которые передал пользователь в наши настройки.
    Object.assign(this.settings, userSettings);

    // Находим элемент, где будут превью картинок и ставим обработчик на этот элемент,
    // при клике на этот элемент вызовем функцию containerClickHandler в нашем объекте
    // gallery и передадим туда событие MouseEvent, которое случилось.
    document
      .querySelector(this.settings.previewSelector)
      .addEventListener('click', event => this.containerClickHandler(event));
  },

  /**
   * Обработчик события клика для открытия картинки.
   * @param {MouseEvent} event Событие клики мышью.
   * @param {HTMLElement} event.target Целевой объект, куда был произведен клик.
   */
  containerClickHandler(event) {
    // Если целевой тег не был картинкой, то ничего не делаем, просто завершаем функцию.
    if (event.target.tagName !== 'IMG') {
      return;
    }
    // Открываем картинку с полученным из целевого тега (data-full_image_url аттрибут).
    if (this.imageExist(event.target.dataset.full_image_url)) {
      this.views = event.target.dataset.views;
      this.openImage(event.target.dataset.full_image_url);
    } else {
      this.openImage(this.settings.openedImageErr404);
    }
    this.activeBigImage = event.target;
  },

  /**
   * Обработчик события клика для перехода к предыдущему изображению
   */
  prevImageClickHandler() {
    if (this.activeBigImage.previousElementSibling != null) {
      if (this.imageExist(this.activeBigImage.previousElementSibling.dataset.full_image_url)) {
        this.views = this.activeBigImage.nextElementSibling.dataset.views;
        this.openImage(this.activeBigImage.previousElementSibling.dataset.full_image_url);
      } else {
        this.openImage(this.settings.openedImageErr404);
      }
      this.activeBigImage = this.activeBigImage.previousElementSibling;
    }
  },

  /**
   * Обработчик события клика для перехода к следующему изображению
   */
  nextImageClickHandler() {
    if (this.activeBigImage.nextElementSibling != null) {
      if (this.imageExist(this.activeBigImage.nextElementSibling.dataset.full_image_url)) {
        this.views = this.activeBigImage.nextElementSibling.dataset.views;
        this.openImage(this.activeBigImage.nextElementSibling.dataset.full_image_url);
      } else {
        this.openImage(this.settings.openedImageErr404);
      }
      this.activeBigImage = this.activeBigImage.nextElementSibling;
    }
  },

  /**
   * Открывает картинку.
   * @param {string} src Ссылка на картинку, которую надо открыть.
   */
  openImage(src) {
    // Получаем контейнер для открытой картинки, в нем находим тег img и ставим ему нужный src.
    this.getScreenContainer().querySelector(`.${this.settings.openedImageClass}`).src = src;
  },

  /**
   * Проверка наличия открываемого фала
   * @return {boolean} true - если файл существует, false - если файла не существует
   */
  imageExist(urlToFile) {
    let xhr = new XMLHttpRequest();
    xhr.open('HEAD', urlToFile, false);
    xhr.send();
    return xhr.status != "404";
  },

  /**
   * Возвращает контейнер для открытой картинки, либо создает такой контейнер, если его еще нет.
   * @returns {Element}
   */
  getScreenContainer() {
    // Получаем контейнер для открытой картинки.
    const galleryWrapperElement = document.querySelector(`.${this.settings.openedImageWrapperClass}`);
    // Если контейнер для открытой картинки существует - возвращаем его.
    if (galleryWrapperElement) {
      return galleryWrapperElement;
    }

    // Возвращаем полученный из метода createScreenContainer контейнер.
    return this.createScreenContainer();
  },

  /**
   * Создает контейнер для открытой картинки.
   * @returns {HTMLElement}
   */
  createScreenContainer() {
    // Создаем сам контейнер-обертку и ставим ему класс.
    const galleryWrapperElement = document.createElement('div');
    galleryWrapperElement.classList.add(this.settings.openedImageWrapperClass);

    // Создаем контейнер занавеса, ставим ему класс и добавляем в контейнер-обертку.
    const galleryScreenElement = document.createElement('div');
    galleryScreenElement.classList.add(this.settings.openedImageScreenClass);
    galleryWrapperElement.appendChild(galleryScreenElement);

    // Создаем картинку для кнопки закрыть, ставим класс, src и добавляем ее в контейнер-обертку.
    const closeImageElement = new Image();
    closeImageElement.classList.add(this.settings.openedImageCloseBtnClass);
    closeImageElement.src = this.settings.openedImageCloseBtnSrc;
    closeImageElement.addEventListener('click', () => this.close());
    galleryWrapperElement.appendChild(closeImageElement);

    // Создаем картинку, которую хотим открыть, ставим класс и добавляем ее в контейнер-обертку.
    const image = new Image();
    image.classList.add(this.settings.openedImageClass);
    galleryWrapperElement.appendChild(image);

    //
    const imgViews = document.createElement('div');
    imgViews.classList.add(this.settings.viewsIconClass);
    imgViews.innerHTML = `<p><i class=\"fas fa-eye\"></i> ${this.views}</p>`;
    galleryWrapperElement.appendChild(imgViews);

    // Добавляем контейнер-обертку в тег body.
    document.body.appendChild(galleryWrapperElement);

    // Возвращаем добавленный в body элемент, наш контейнер-обертку.
    return galleryWrapperElement;
  },

  /**
   * Закрывает (удаляет) контейнер для открытой картинки.
   */
  close() {
    document.querySelector(`.${this.settings.openedImageWrapperClass}`).remove();
  }
};

// Инициализируем нашу галерею при загрузке страницы.
window.onload = () => gallery.init({previewSelector: '.galleryPreviewsContainer'});
