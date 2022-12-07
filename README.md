# flutter_state_example

A very basic flutter app that shows various methods of state management used with Forms

## State Examples

- [Forms](https://docs.flutter.dev/cookbook/forms/validation)
  - includes: activating validation after initial submit
- OnChangedFormFields
  - uses only fiels with `initialValue` and `onChanged()`
  - includes: interfield validation
- [Provider](https://pub.dev/packages/provider)
  - includes: activating validation after initial submit
- [Cubit (bloc)](https://bloclibrary.dev/)
  - includes: activating validation after initial submit
- [RiverPod](https://riverpod.dev/)
  - includes: activating validation after initial submit

## Getting Started

`fvm use 3.3.8`

`launch.json` has a configuration for each State System.

## ToDo

1. Inter-field validation
2. Form validation message
3. Focus to first field that is invalid after click on button
4. Form Type: Save to app state on submit if form is valid
5. Form Type: Save to app state once field is valid (auto save, no same or submit button)
6. Add unit testing
