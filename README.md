# Dead Keys

Dead keys management in Flutter

[![MIT License][license-badge]][license-link]

## Usage

See the `example` directory for a minimal example of how to use this package.
You typically just need to replace your `TextEditingController` with `DeadKeysTextEditingController` 
and provide a `keyMap` in the constructor, either custom or choosing from:

* `albanianKeyMap`
* `belgianKeyMap`
* `bosnianKeyMap`
* `canadianKeyMap`
* `czechKeyMap`
* `danishKeyMap`
* `dutchKeyMap`
* `englishIndiaKeyMap`
* `faroeseKeyMap`
* `finnishKeyMap`
* `frenchKeyMap`
* `germanKeyMap`
* `greekKeyMap`
* `greenlandicKeyMap`
* `hungarianKeyMap`
* `icelandicKeyMap`
* `irishKeyMap`
* `latvianKeyMap`
* `luxembourgishKeyMap`
* `norwegianKeyMap`
* `polishKeyMap`
* `portugueseKeyMap`
* `romanianKeyMap`
* `serbianKeyMap`
* `slovakKeyMap`
* `slovenianKeyMap`
* `spanishKeyMap`
* `swedishKeyMap`
* `swissKeyMap`
* `turkishKeyMap`
* `unitedKingdomExtentedKeyMap`
* `unitedStatesInternationalKeyMap`
  
For custom controllers you can just use the `DeadKeysMixin` with your own class.