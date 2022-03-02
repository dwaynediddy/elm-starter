import { Elm } from './src/Main.elm';
import $ from 'jquery';
import './notificationFx.js';
import './notificationFx.css';
import 'normalize.css';
import 'animate.css';

// Styles
require('./assets/styles/skeleton.css');
require('./assets/styles/main.scss');

Elm.Main.init({
  node: document.getElementById('app'),
  flags: {}
});
