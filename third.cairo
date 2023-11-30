#[starknet::interface]
trait ISimpleStorage<TContractState> {
    fn setvarx(ref self: TContractState, x: u128);
    fn getvarx(self: @TContractState) -> u128;
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
        fn setvarx(ref self: ContractState, x: u128) {
            self.stored_data.write(x);
        }
        fn getvarx(self: @ContractState) -> u128 {
            self.stored_data.read()
        }
    }
}
