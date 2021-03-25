__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "default", function() { return _default; });
/* harmony import */ var _helpers_passive__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ../helpers/passive */ "./src/js/helpers/passive.js");
function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

function _defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } }

function _createClass(Constructor, protoProps, staticProps) { if (protoProps) _defineProperties(Constructor.prototype, protoProps); if (staticProps) _defineProperties(Constructor, staticProps); return Constructor; }



var _default = /*#__PURE__*/function () {
  function _default(selector) {
    _classCallCheck(this, _default);

    this.el = document.querySelector(selector);
    this.select = this.el.querySelector('select');
    this.changeHandler = null;
    this.setup();
  }

  _createClass(_default, [{
    key: "setup",
    value: function setup() {
      this.changeHandler = this.onChange.bind(this);
      this.select.addEventListener('change', this.changeHandler, _helpers_passive__WEBPACK_IMPORTED_MODULE_0__["default"]);
      this.select.setAttribute('aria-selected', false);
      this.onChange();
    }
  }, {
    key: "destroy",
    value: function destroy() {
      this.select.removeEventListener('change', this.changeHandler, _helpers_passive__WEBPACK_IMPORTED_MODULE_0__["default"]);
      this.changeHandler = null;
      this.select = null;
      this.el = null;
    }
  }, {
    key: "onChange",
    value: function onChange() {
      var isSelected = this.select.value ? true : false;
      this.select.setAttribute('aria-selected', isSelected);
    }
  }]);

  return _default;
}();


__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "default", function() { return _default; });
/* harmony import */ var _helpers_passive__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ../helpers/passive */ "./src/js/helpers/passive.js");
function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

function _defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } }

function _createClass(Constructor, protoProps, staticProps) { if (protoProps) _defineProperties(Constructor.prototype, protoProps); if (staticProps) _defineProperties(Constructor, staticProps); return Constructor; }



var _default = /*#__PURE__*/function () {
  function _default(selector) {
    _classCallCheck(this, _default);

    this.el = document.querySelector(selector);
    this.select = this.el.querySelector('select');
    this.changeHandler = null;
    this.setup();
  }

  _createClass(_default, [{
    key: "setup",
    value: function setup() {
      this.changeHandler = this.onChange.bind(this);
      this.select.addEventListener('change', this.changeHandler, _helpers_passive__WEBPACK_IMPORTED_MODULE_0__["default"]);
      this.select.setAttribute('aria-selected', false);
      this.onChange();
    }
  }, {
    key: "destroy",
    value: function destroy() {
      this.select.removeEventListener('change', this.changeHandler, _helpers_passive__WEBPACK_IMPORTED_MODULE_0__["default"]);
      this.changeHandler = null;
      this.select = null;
      this.el = null;
    }
  }, {
    key: "onChange",
    value: function onChange() {
      var isSelected = this.select.value ? true : false;
      this.select.setAttribute('aria-selected', isSelected);
    }
  }]);

  return _default;
}();


