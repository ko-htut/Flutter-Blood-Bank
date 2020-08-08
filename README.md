# Blood Bank Flutter Admin Application

## Feature

- Admin Login & register
- Detail
- Donar ` Status`  , `Create` ,`Update` , `Delete` , `List` ,  `History` & `Password change`

## Preview

The effect of some pages is as follows:

| ![](https://raw.githubusercontent.com/ko-htut/Flutter-Blood-Bank/master/dashboard.png) | ![](https://raw.githubusercontent.com/ko-htut/Flutter-Blood-Bank/master/blood.png) | ![](https://raw.githubusercontent.com/ko-htut/Flutter-Blood-Bank/master/donarlist.png) | ![](https://raw.githubusercontent.com/ko-htut/Flutter-Blood-Bank/master/profile.png) | 
|:-----------------------------------------------------:|:-----------------------------------------------------:|:-----------------------------------------------------:|:-----------------------------------------------------:|
| ![](https://raw.githubusercontent.com/ko-htut/Flutter-Blood-Bank/master/adminlogin.png) | ![](https://raw.githubusercontent.com/ko-htut/Flutter-Blood-Bank/master/userregister.png) | ![](https://raw.githubusercontent.com/ko-htut/Flutter-Blood-Bank/master/donarlist.png) | ![](https://raw.githubusercontent.com/ko-htut/Flutter-Blood-Bank/master/profile.png) | 

## Using Library

| Library                                                                                    | Features                      |
|--------------------------------------------------------------------------------------------|-------------------------------|
| [dio](https://github.com/flutterchina/dio)                                                 | **Network library**           |
| [provider](https://github.com/rrousselGit/provider)                                        | **State management**          |
| [cached_network_image](https://github.com/renefloor/flutter_cached_network_image)          | **Image loading**             |
| [fluro](https://github.com/theyakka/fluro)                                                 | **Routing management**        |
| [fluttertoast](https://github.com/OpenFlutter/flutter_oktoast)                             | **Toast**                     |
| [marquee_widget](https://pub.dev/packages/marquee_widget)                                   | **scrolls Widget** |
| [page_transition](https://pub.dev/packages/page_transition)                                  | **Beautiful page transitions** |
| [shared_preferences](https://pub.dev/packages/shared_preferences)                               | **Dart Common tools library** |
| [common_utils](https://pub.dev/packages/common_utils)                                     | **Dart Common tools library** |
| [cookie_jar](https://pub.dev/packages/cookie_jar)                                       | **cookie manager** |
| [get_it](https://pub.dev/packages/get_it)                                           | **UI tools library** |
| [flutter_easyrefresh](https://pub.dev/packages/flutter_easyrefresh)                              | **EasyRefresh** |
| [extended_text](https://pub.dev/packages/extended_text)                                    | **special text** |
| [loading_more_list](https://pub.dev/packages/loading_more_list)                                | **oading more list** |

## Api

- main url ( https://mohnyin.net/api/v1/admin )

| Name | METHOD | URL |REQUEST |
|-----|-----|-----|-----|
| Register | Post | /register | name*, email*, password* |
| Login | Post | /register | email*, password* |
| Detail | Post | /register | - |
| Donar - Status | Post | /register | status* [integer 0,1] |
| Donar - Password | Post | /register | password*|
| Donar - Create | Post | /register | name*, email*, password*, phone*, blood_type*, city*, address*, image* [file] |
| Donar - Update | Post | /register | name*, email*, phone*, blood_type*, city*, address*, image* [file] |
| Donar - Delete | Post | /register | donar_id*[integer]|
| Donar - List | Post | /register | - |
| Donar - History | Post | /donar/history | donar_id*[integer] |