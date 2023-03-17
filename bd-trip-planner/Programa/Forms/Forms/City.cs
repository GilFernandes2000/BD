using System;
using System.Collections;
using System.Text;

namespace TripPlanner{
    [Serializable()]
    class City{
        private string _name;
        private string _country;
        private string _continent;

        public String City_name{
            get {
                return _name;
            }
            set {
                if (String.IsNullOrEmpty(value)){
                    throw new Exception("City must have a name");
                }
                _name = value;
            }
        }

        public String Country_name{
            get {
                return _country;
            }
            set {
                if (String.IsNullOrEmpty(value)){
                    throw new Exception("Country must have a name");
                }
                _country = value;
            }
        }

        public String Continent_name{
            get {
                return _continent;
            }
            set {
                if (String.IsNullOrEmpty(value)){
                    throw new Exception("Continent must have a name");
                }
                _continent = value;
            }
        }
    }
}