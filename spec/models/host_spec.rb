describe Host do
  it { is_expected.to validate_uniqueness_of(:name) }
  it { is_expected.to allow_value('no_spaces').for(:name).with_message('No spaces allowed') }
  it { is_expected.to_not allow_value('ba d1').for(:name).with_message('No spaces allowed') }
end