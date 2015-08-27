require('spec_helper')

describe(Instruction) do
  it { should belong_to(:recipe) }
end
