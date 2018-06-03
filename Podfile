platform :ios, '11.0'

target 'ProceduresNavigator' do
  use_frameworks!

  #RxSwift used for FRP bindings (useful for VM <-> V in MVVM)
  pod 'RxSwift'

  #RxCocoa adds UIKit / Foundation specific helpers on top of RxSwift (e.g. binding to a UILabel text, or creating an observable from URLSession request)
  pod 'RxCocoa'

  #image caching helpers
  pod 'Kingfisher'

  target 'ProceduresNavigatorTests' do
    inherit! :search_paths
  end
end
