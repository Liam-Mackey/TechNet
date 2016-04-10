@Items = React.createClass
  getInitialState: ->
    items: @props.data
  getDefaultState: ->
    items: []
  render: ->
    React.DOM.div
      className: 'Items'
      React.DOM.h2
        className: 'title'
        'Items'
      React.DOM.table
        className: 'table table-bordered'
        React.DOM.thead null,
          React.DOM.tr null,
            React.DOM.th null, 'Title'
            React.DOM.th null, 'Description'
            React.DOM.th null, 'Amount'
            React.DOM.th null, 'Photo'
        React.DOM.tbody null,
          for item in @state.items
            React.createElement Item, key: item.id, item: item
