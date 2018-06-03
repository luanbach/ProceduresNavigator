platform :ios, '11.0'

target 'ProceduresNavigator' do
  use_frameworks!

  #RxSwift used for FRP bindings (useful for VM <-> V in MVVM)
  pod 'RxSwift', '~> 4.0'

  #RxCocoa adds UIKit / Foundation specific helpers on top of RxSwift (e.g. binding to a UILabel text, or creating an observable from URLSession request)
  pod 'RxCocoa', '~> 4.0'

  #image caching helpers
  pod 'Kingfisher', '~> 4.0'

  target 'ProceduresNavigatorTests' do
    inherit! :search_paths
  end
end
