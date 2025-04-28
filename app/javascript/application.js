// app/javascript/application.js
import { Application } from '@hotwired/stimulus';
import { Turbo } from '@hotwired/turbo-rails';
import { definitionsFromContext } from '@hotwired/stimulus-webpack-helpers';

window.Stimulus = Application.start();
window.Turbo = Turbo; // Opcional: expõe Turbo globalmente se necessário
const context = require.context('../controllers', true, /\.js$/);
Stimulus.load(definitionsFromContext(context));

console.log("Turbo loaded:", Turbo);
console.log("Stimulus loaded:", application);