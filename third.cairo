#[starknet::interface]
trait ISimpleStorage<TContractState> {
    fn setvar(ref self: TContractState, x: u128);
    fn getvar(self: @TContractState) -> u128;
}

#[starknet::contract]
mod SimpleStorage {
    use starknet::get_caller_address;
    use starknet::ContractAddress;

    #[storage]
    struct Storage {
        stored_data: u128
    }

    #[external(v0)]
    impl SimpleStorage of super::ISimpleStorage<ContractState> {
        fn setvar(ref self: ContractState, x: u128) {
            self.stored_data.write(x);
        }
        fn getvar(self: @ContractState) -> u128 {
            self.stored_data.read()
        }
    }
}
