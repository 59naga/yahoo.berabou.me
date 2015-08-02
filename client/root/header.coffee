module.exports= ($state)->
  viewModel= this

  viewModel.periods= [
    {
      label: '１時間以内'
      vd: 'h'
    }
    {
      label: '２４時間以内'
      vd: 'd'
    }
    {
      label: '１週間以内'
      vd: 'w'
    }
    {
      label: '１ヶ月以内'
      vd: 'm1'
    }
    {
      label: '３ヶ月以内'
      vd: 'm3'
    }
    {
      label: '６ヶ月以内'
      vd: 'm6'
    }
    {
      label: '１年以内'
      vd: 'y'
    }
  ]

  viewModel
