
/*
 * Copyright (C) 2000, 2001
 * Ferdinando Ametrano, Luigi Ballabio, Adolfo Benin, Marco Marchioro
 * 
 * This file is part of QuantLib.
 * QuantLib is a C++ open source library for financial quantitative
 * analysts and developers --- http://quantlib.sourceforge.net/
 *
 * QuantLib is free software and you are allowed to use, copy, modify, merge,
 * publish, distribute, and/or sell copies of it under the conditions stated 
 * in the QuantLib License.
 *
 * This program is distributed in the hope that it will be useful, but 
 * WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
 * or FITNESS FOR A PARTICULAR PURPOSE. See the license for more details.
 *
 * You should have received a copy of the license along with this file;
 * if not, contact ferdinando@ametrano.net
 *
 * QuantLib license is also available at
 *   http://quantlib.sourceforge.net/LICENSE.TXT
*/

/* $Source$
   $Log$
   Revision 1.22  2001/03/09 12:40:41  lballabio
   Spring cleaning for SWIG interfaces

*/

#ifndef quantlib_pricers_i
#define quantlib_pricers_i

%include Date.i
%include Options.i
%include Financial.i
%include Vectors.i

%{
using QuantLib::Pricers::BSMEuropeanOption;
using QuantLib::Pricers::FiniteDifferenceEuropean;
using QuantLib::Pricers::AmericanOption;
using QuantLib::Pricers::ShoutOption;
using QuantLib::Pricers::DividendAmericanOption;
using QuantLib::Pricers::DividendEuropeanOption;
using QuantLib::Pricers::BinaryOption;
%}

class BSMEuropeanOption {
  public:
	BSMEuropeanOption(OptionType type, double underlying, double strike, 
	  Rate dividendYield, Rate riskFreeRate, Time residualTime, 
	  double volatility);
	~BSMEuropeanOption();
	double value() const;
	double delta() const;
	double gamma() const;
	double theta() const;
	double vega() const;
	double rho() const;
	double impliedVolatility(double targetValue, double accuracy = 1e-4, 
	  int maxEvaluations = 100) const ;
};

class FiniteDifferenceEuropean {
  public:
	FiniteDifferenceEuropean(OptionType type, double underlying, double strike, 
	  Rate dividendYield, Rate riskFreeRate, Time residualTime, 
	  double volatility, int timeSteps = 200, int gridPoints = 800);
	~FiniteDifferenceEuropean();
	double value() const;
	double delta() const;
	double gamma() const;
	double theta() const;
	double vega() const;
	double rho() const;
	double impliedVolatility(double targetValue, double accuracy = 1e-4, 
	  int maxEvaluations = 100) const ;
};

class BinaryOption {
  public:
	BinaryOption(OptionType type, double underlying, double strike, 
	  Rate dividendYield, Rate riskFreeRate, Time residualTime, 
	  double volatility, double cashPayoff = 1);
	~BinaryOption();
	double value() const;
	double delta() const;
	double gamma() const;
	double theta() const;
	double vega() const;
	double rho() const;
	double impliedVolatility(double targetValue, double accuracy = 1e-4, 
	  int maxEvaluations = 100) const ;
};

class AmericanOption {
  public:
	AmericanOption(OptionType type, double underlying, double strike, 
	  Rate dividendYield, Rate riskFreeRate, Time residualTime,
	  double volatility, int timeSteps = 100, int gridPoints = 100);
    ~AmericanOption();
	double value() const;
	double delta() const;
	double gamma() const;
	double theta() const;
	double vega() const;
	double rho() const;
	double impliedVolatility(double targetValue, double accuracy = 1e-4,
                             int maxEvaluations = 100) const ;
};
class ShoutOption {
  public:
	ShoutOption(OptionType type, double underlying, double strike, 
	  Rate dividendYield, Rate riskFreeRate, Time residualTime,
	  double volatility, int timeSteps = 100, int gridPoints = 100);
    ~ShoutOption();
	double value() const;
	double delta() const;
	double gamma() const;
	double theta() const;
	double vega() const;
	double rho() const;
	double impliedVolatility(double targetValue, double accuracy = 1e-4,
                             int maxEvaluations = 100) const ;
};

class DividendAmericanOption {
  public:
	DividendAmericanOption(OptionType type, double underlying, double strike, 
	  Rate dividendYield, Rate riskFreeRate, Time residualTime,
	  double volatility, DoubleVector dividends, DoubleVector exdivdates,
	  int timeSteps = 100, int gridPoints = 100);
	~DividendAmericanOption();
	double value() const;
	double delta() const;
	double gamma() const;
	double theta() const;	
	double vega() const;
	double rho() const;
	double impliedVolatility(double targetValue, double accuracy = 1e-4,
	  int maxEvaluations = 100) const ;
};

class DividendEuropeanOption {
  public:
	DividendEuropeanOption(OptionType type, double underlying, double strike, 
	  Rate dividendYield, Rate riskFreeRate, Time residualTime,
	  double volatility, DoubleVector dividends, DoubleVector exdivdates);
	~DividendEuropeanOption();
	double value() const;
	double delta() const;
	double gamma() const;
	double theta() const;
	double vega() const;
	double rho() const;
	double impliedVolatility(double targetValue, double accuracy = 1e-4,
	  int maxEvaluations = 100) const ;
};

%include Barrier.i

%{
using QuantLib::Pricers::BarrierOption;
%}


class BarrierOption {
  public:
    BarrierOption(BarrierType barrType, OptionType type, double underlying, 
        double strike, Rate dividendYield, Rate riskFreeRate,
        Time residualTime, double volatility, double barrier, 
        double rebate = 0.0);
    ~BarrierOption();
    double value() const;
};


#endif
