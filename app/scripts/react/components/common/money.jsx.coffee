###* @jsx React.DOM ###

window.Money = React.createClass

  propTypes:
    money: React.PropTypes.object

  render: ->
    if @props.money
      #TODO: Учитывать валюту
      `<span className="nobr">
        { (this.props.money.cents / 100).toLocaleString('ru-RU') } руб.
       </span>`
    else
      `<span className="nobr">---</span>`