contract Math{
    //This is a compile-time constant which must point to the 
    // math-registry of submodules
    uint constant MATH_REGISTRY_ADR = 0x692a70d2e424a56d2c6c27aa97d1a86395877b3a;

    /**
     * Below are math functions
     **/

    function cosine(uint n) constant returns (uint) {
        // First, if called as library, we need to obtain a reference to Trigonomertry by 
        // invoking the lib as a contract, with access to storage
        address trig_module = MathModulesRegistry(MATH_INSTANCE_ADR).get_module(0);

        //Dispatch to the trig library
        //Now, we make a `callcode` invocation of it
        return Trig_lib(trig_module).cosine(n);
    }
    /*
     * More math-functions below, all invoking different submodules
     */
}