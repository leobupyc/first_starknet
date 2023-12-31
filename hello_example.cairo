#[contract]
mod HelloStarknet {
    use starknet::get_caller_address;
    use starknet::ContractAddress;


    #[event]
    fn Helo(from: ContractAddress, value: felt252) {}


    #[external]
    fn Say_Hello(message: felt252) {
        let callerref = get_caller_address();
        Helo(callerref, message);
    }
