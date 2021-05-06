
import UIKit
import CoreLocation

class WeatherViewController: UIViewController{
    
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextfield: UITextField!
    
   
    var weatherManager = WeatherManager()
    
    @IBAction func locationPressed(_ sender: UIButton) {
        locationManager.requestLocation()
    }
    
    // CLLocationManager 는 The object that you use to start and stop the delivery of location-related events to your app.
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // delegate를 먼저 선언 해줘야함.
        locationManager.delegate = self
        //Requests the user’s permission to use location services while the app is in use.
        // 앱이 로드 되자마자 사용자에게 로케이션 동의를 구함
        locationManager.requestWhenInUseAuthorization()
        // requestLocation : Requests the one-time delivery of the user’s current location.
        // When using this method, the associated delegate must implement the locationManager(_:didUpdateLocations:) and locationManager(_:didFailWithError:) methods. Failure to do so is a programmer error. 두 델리게이트는 무조건 구현 해야함
        locationManager.requestLocation()
        
       
        searchTextfield.delegate = self
        weatherManager.delegate = self
    }
}
//MARK: - UITextfieldDelegate
extension WeatherViewController: UITextFieldDelegate {
    
    @IBAction func searchPressed(_ sender: UIButton) {
        // 텍스트 입력창 내리기
        searchTextfield.endEditing(true) // 이벤트 발생시 키보드 내려감
        print(searchTextfield.text!)
        
    }
    
    // hey viewController return button just got tapped!
    // 텍스트 필드에 대해 Return 단추 누르기를 처리할지 여부를 delegate 에게 묻는다.
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextfield.endEditing(true) // 이벤트 발생시 키보드 내려감
        print(searchTextfield.text!)
        return true
    }
    // hey viewController textfield should get typed before endEditing
    // 유효성 검사시 많이 사용된다!
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != ""{
            return true
        }else{
            textField.placeholder = "Type Something!"
            return false
        }
    }
    // hey! viewController textfield just finished editing!!
    //editing이 완전히 끝나고 난뒤 발생 할 이벤트
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if let city = searchTextfield.text {
            weatherManager.fetchWeather(cityName: city)
        }
        
        searchTextfield.text = ""
        
    }
}

//MARK: - WeatherDelegeate

extension WeatherViewController : WeatherDelegate {
    // weatherDelegate // textFiekdDidEndEnditing 에 같이 발생될 이벤트
    func didUpdateWeather(_ weatherManager : WeatherManager ,weather: WeatherModel) {
//        print(weather.temperatureString)
        DispatchQueue.main.async {
            self.temperatureLabel.text = weather.temperatureString
            self.conditionImageView.image = UIImage(systemName: weather.conditionName)
            self.cityLabel.text = weather.cityName
        }
        
    }
    func didFailWithError(error: Error) {
        print(error)
    }
}

//MARK: -locationManagerDelegate
extension WeatherViewController : CLLocationManagerDelegate{
    //error  발생시
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    //summary : Tells the delegate that new location data is available.
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        if let location = locations.last {// 로케이션 정보의 마지막을 확인 있는지 여부
            locationManager.stopUpdatingLocation() // 로드시 requestLocation이 호출 되는데
            //있을시에는 ~~~~ 지리적 위치 구하기
            let lat = location.coordinate.latitude
            let lon = location.coordinate.longitude
            print("ㅁㄴㅇ\(lat)")
            print("ㅁㄴㅇ\(lon)")
            weatherManager.fetchWeather(latitude : lat , longitude : lon)
            
        }
    }
}


