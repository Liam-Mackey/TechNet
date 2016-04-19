@ItemForm = React.createClass
  getInitialState: ->
    title: ''
    description: ''
    price: null
    photo_url: ''
    seller_id: null
  handleChange: (e) ->
    name = e.target.name
    @setState "#{ name }": e.target.value
  handleSubmit: (e) ->
    e.preventDefault()
    $.post '/items', { item: @state }, (data) =>
      @props.handleNewItem data
      @setState @getInitialState()
    , 'JSON'
  valid: ->
    @state.title && @state.description && @state.price
  render: ->
    React.DOM.form
      className: 'form-inline'
      onSubmit: @handleSubmit
      React.DOM.div
        className: 'form-group'
        React.DOM.input
          type: 'text'
          className: 'form-control'
          placeholder: 'Title'
          name: 'title'
          value: @state.title
          onChange: @handleChange
        React.DOM.input
          type: 'textarea'
          className: 'form-control'
          placeholder: 'Description'
          name: 'description'
          value: @state.description
          onChange: @handleChange
        React.DOM.input
          type: 'number'
          className: 'form-control'
          placeholder: 'Sale Price'
          name: 'price'
          value: @state.price
          onChange: @handleChange
        React.DOM.input
          type: 'text'
          className: 'form-control'
          placeholder: 'Photo Url'
          name: 'photo_url'
          value: @state.photo_url
          onChange: @handleChange
        React.DOM.button
          type: 'submit'
          className: 'btn btn-primary'
          disabled: !@valid()
          'Create Item'