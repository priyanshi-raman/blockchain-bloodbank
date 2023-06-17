pragma solidity ^0.8.0;

contract bloodbank {
    uint256 public donorCount=0;
    uint256 public patientCount=0;
    uint256 public requestCount=0;
    uint256 public OposCount=0;
    uint256 public OnegCount=0;
    uint256 public AposCount=0;
    uint256 public AnegCount=0;
    uint256 public BposCount=0;
    uint256 public BnegCount=0;
    uint256 public ABposCount=0;
    uint256 public ABnegCount=0;
    uint256[] unitCount = [OposCount, OnegCount, AposCount, AnegCount, BposCount, BnegCount, ABposCount, ABnegCount];

    donor[] public allDonors;
    patient[] public allPatients;

    struct donor 
    {
        uint256 donorID;
        string firstName;
        string lastName;
        uint256 bloodGroup;
        uint256 numberUnits;
        bool bloodDonated;
    }

    struct patient {
        uint256 patientID;
        string firstName;
        string lastName;
        uint256 bloodGroup;
        uint256 numberUnits;
        bool bloodRequested;
    }
    
    function addDonor(string memory _firstName, string memory _lastName, uint256 _bloodGroup, uint256 _numberUnits, bool _bloodDonated) public {
        donorCount+=1;
        allDonors.push(donor(donorCount, _firstName, _lastName, _bloodGroup, _numberUnits, _bloodDonated));
        if(_bloodGroup==1)
        {
            OposCount+=_numberUnits;
        }
        else if(_bloodGroup==2)
        {
            OnegCount+=_numberUnits;
        }
        else if(_bloodGroup==3)
        {
            AposCount+=_numberUnits;
        }
        else if(_bloodGroup==4)
        {
            AnegCount+=_numberUnits;
        }
        else if(_bloodGroup==5)
        {
            BposCount+=_numberUnits;
        }
        else if(_bloodGroup==6)
        {
            BnegCount+=_numberUnits;
        }
        else if(_bloodGroup==7)
        {
            ABposCount+=_numberUnits;
        }
        else if(_bloodGroup==8)
        {
            ABnegCount+=_numberUnits;
        }
    }

    function addPatient(string memory _firstName, string memory _lastName, uint256 _bloodGroup, uint256 _numberUnits, bool _bloodRequested) public {
        patientCount+=1;
        if(_bloodRequested)
        {
            requestCount++;
            if(_bloodGroup==1 && OposCount>=_numberUnits)
            {
                OposCount-=_numberUnits;
            }
            else if(_bloodGroup==2 && OnegCount>=_numberUnits)
            {
                OnegCount-=_numberUnits;
            }
            else if(_bloodGroup==3 && AposCount>=_numberUnits)
            {
                AposCount-=_numberUnits;
            }
            else if(_bloodGroup==4 && AnegCount>=_numberUnits)
            {
                AnegCount-=_numberUnits;
            }
            else if(_bloodGroup==5 && BposCount>=_numberUnits)
            {
                BposCount-=_numberUnits;
            }
            else if(_bloodGroup==6 && BnegCount>=_numberUnits)
            {
                BnegCount-=_numberUnits;
            }
            else if(_bloodGroup==7 && ABposCount>=_numberUnits)
            {
                ABposCount-=_numberUnits;
            }
            else if(_bloodGroup==8 && ABnegCount>=_numberUnits)
            {
                ABnegCount-=_numberUnits;
            }
        }
        allPatients.push(patient(patientCount, _firstName, _lastName, _bloodGroup, _numberUnits, _bloodRequested));
    }

    function updateDonor(uint256 _donorID, uint256 _numberUnits) public {
        allDonors[_donorID].numberUnits += _numberUnits;
    }

    function getUnitCount() public returns (uint256[] memory) {
        return unitCount;        
    }
}