//
//  ViewController.swift
//  WeatherApp
//
//  Created by Юлия Караневская on 31.08.21.
//

import UIKit

class WeatherViewController: UIViewController {
    
    var networkWeatherManager = NetworkWeatherManager()
    
    //MARK: UI
    private let weatherImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(systemName: "cloud.rain.fill")
        return iv
    }()
    
    private let temperatureLabel: UILabel = {
        let l = UILabel()
        l.textAlignment = .center
        l.text = "23C"
        l.font = l.font.withSize(40)
        return l
    }()
    
    private let feelsLikeTemperatureLabel: UILabel = {
        let l = UILabel()
        l.textAlignment = .center
        l.text = "Feels like 23C"
        l.numberOfLines = 0
        l.font = l.font.withSize(20)
        return l
    }()
    
    private let cityLabel: UILabel = {
        let l = UILabel()
        l.textAlignment = .center
        l.text = "Grodno"
        l.font = l.font.withSize(30)
        return l
    }()
    
    private let searchCityButton: UIButton = {
        let b = UIButton()
        b.backgroundColor = .systemPink
        b.layer.cornerRadius = 20
        b.setTitle("Search for city", for: .normal)
        b.clipsToBounds = true
        b.addTarget(self, action: #selector(searchCityPressed), for: .touchUpInside)
        return b
    }()
    
    //MARK: VC Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        setUpUI()
    }
    
    private func presentAlertController(completionHandler: @escaping (String) -> Void) {
        let alert = UIAlertController(title: "Your city", message: "", preferredStyle: .alert)
        alert.addTextField { textField in
            textField.placeholder = "Your City"
        }
        alert.addAction(UIAlertAction(title: "Search", style: .default, handler: { action in
            let textField = alert.textFields?.first
            guard let cityName = textField?.text else { return }
            if cityName != "" {
//                self.networkWeatherManager.fetchCurrentWeather(forCity: cityName)
//                self.cityLabel.text = cityName
                let city = cityName.split(separator: " ").joined(separator: "%20")
                completionHandler(city)
            }
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    @objc private func searchCityPressed() {
        presentAlertController { city in
            self.networkWeatherManager.fetchCurrentWeather(forCity: city)
        }

    }
    
    private func addSubviews() {
        view.addSubview(weatherImageView)
        view.addSubview(temperatureLabel)
        view.addSubview(feelsLikeTemperatureLabel)
        view.addSubview(cityLabel)
        view.addSubview(searchCityButton)
    }
    
    private func setUpUI() {
        setUpWeatherImageView()
        setUpTemperatureLabel()
        setUpFeelsLikeTemperatureLabel()
        setUpCityLabel()
        setUpSearchCityButton()
    }
    
    private func setUpWeatherImageView() {
        weatherImageView.translatesAutoresizingMaskIntoConstraints = false
        weatherImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100).isActive = true
        weatherImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        weatherImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        weatherImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    private func setUpTemperatureLabel() {
        temperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        temperatureLabel.topAnchor.constraint(equalTo: weatherImageView.bottomAnchor).isActive = true
        temperatureLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        temperatureLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true
        temperatureLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    private func setUpFeelsLikeTemperatureLabel() {
        feelsLikeTemperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        feelsLikeTemperatureLabel.topAnchor.constraint(equalTo: temperatureLabel.bottomAnchor).isActive = true
        feelsLikeTemperatureLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        feelsLikeTemperatureLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true
        feelsLikeTemperatureLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    private func setUpCityLabel() {
        cityLabel.translatesAutoresizingMaskIntoConstraints = false
        cityLabel.topAnchor.constraint(equalTo: feelsLikeTemperatureLabel.bottomAnchor).isActive = true
        cityLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        cityLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        cityLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
    private func setUpSearchCityButton() {
        searchCityButton.translatesAutoresizingMaskIntoConstraints = false
        searchCityButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true
        searchCityButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        searchCityButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        searchCityButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
    }


}

