module Dsl

  ## 
  # AST nodes

  class ValueNode < Struct.new(:value); end
  class PairNode < Struct.new(:key, :value); end
  class Integer < ValueNode; end
  class IntegerList < ValueNode; end
  class PairList < ValueNode; end
  class ValueList < ValueNode; end
  class VMSpec < Struct.new(:name, :count, :image_name); end
  class ServicePortDefinition < Struct.new(:port, :healthcheck_endpoint, :healthcheck_port); end
  class ServiceDefinitionList < ValueNode; end
  class NamedBootstrapSequence < Struct.new(:name, :sequence); end
  class NamedBootstrapSequenceList < ValueNode; end
  class LoadBalancerDefinitionBlock < Struct.new(:vm_spec, :flavor, :bootstrap_sequence); end
  class PoolDefinition < Struct.new(:vm_spec, :flavor, :services, :bootstrap_sequence); end
  class TCPPoolDefinition < PoolDefinition
    def type; "TCP"; end
  end
  class HTTPPoolDefinition < PoolDefinition
    def type; "HTTP"; end
  end
  class PoolDefinitionList < ValueNode; end
  class BoxDefinition < Struct.new(:vm_spec, :flavor, :bootstrap_sequence); end
  class BoxDefinitionList < ValueNode; end
  class Defaults < ValueNode; end

end
