describe Host do
  it { is_expected.to validate_uniqueness_of(:name) }
end