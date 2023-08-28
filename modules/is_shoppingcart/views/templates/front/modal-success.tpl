{extends file='components/modal.tpl'}

{block name='modal_extra_attribues'}id="blockcart-modal"{/block}
{block name='modal_title'}{l s='Producto agregado al carrito' d='Modules.Isshoppingcart.Modalsuccess'}{/block}


{block name='modal_body'}

  <div class="cart-products p-0 mb-4 flex-wrap">
    <div class="cart-products__thumb">
      {images_block webpEnabled=$webpEnabled}
        <img
          class="img-fluid rounded"
          {generateImagesSources image=$product.default_image size='cart_default' lazyload=false}
          alt="{$product.cover.legend}"
          title="{$product.cover.legend}">
      {/images_block}
    </div>
    <div class="cart-products__desc">
        <p class="h6 mb-2 font-sm">
          {$product.name}
        </p>
        <div class="price price--sm">{$product.price}
        {if $cart.products}
          {assign var="lastProductCart" value=$cart.products|end}
          <span class="text-muted small">x {$lastProductCart.quantity_wanted} pzs.</span>
        {/if}
        {hook h='displayProductPriceBlock' product=$product type="unit_price"}
    </div>
  </div>

  <hr class="w-100">
  <div class="d-flex flex-column w-100">
  {if !empty($cart.subtotals.products.value)}
    <div class="cart-summary-line mb-2 justify-content-between">
      <span class="label">{l s='Subtotal:' d='Modules.Isshoppingcart.Modalsuccess'}</span>
      <span class="value">{$cart.subtotals.products.value}</span>
    </div>
  {/if}

  {if !empty($cart.subtotals.shipping.value)}
    <div class="cart-summary-line mb-2 justify-content-between">
      <span class="label">{l s='Envío:' d='Modules.Isshoppingcart.Modalsuccess'}</span>
      <span class="value">{$cart.subtotals.shipping.value} {hook h='displayCheckoutSubtotalDetails' subtotal=$cart.subtotals.shipping}</span>
    </div>
  {/if}

  {if !$configuration.display_prices_tax_incl && $configuration.taxes_enabled}
    <div class="cart-summary-line cart-total mb-2 justify-content-between">
      <span class="label">{$cart.totals.total.label}&nbsp;{$cart.labels.tax_short}</span>
      <span class="value">{$cart.totals.total.value}</span>
    </div>
    <div class="cart-summary-line cart-total mb-0 justify-content-between">
      <span class="label">{$cart.totals.total_including_tax.label}</span>
      <span class="value">{$cart.totals.total_including_tax.value}</span>
    </div>
  {else}
    <div class="cart-summary-line cart-total mb-0 justify-content-between">
      <span class="label">{$cart.totals.total.label}&nbsp;{if $configuration.taxes_enabled}{$cart.labels.tax_short}{/if}</span>
      <span class="value">{$cart.totals.total.value}</span>
    </div>
  {/if}
  </div>
{/block}

{block name='modal_footer'}
  <a href="{$cart_url}" class="btn btn-primary btn-block">{l s='Proceder al pago' d='Shop.Theme.Actions'}</a>
  <button type="button" class="btn btn-text btn-block" data-dismiss="modal">{l s='Continuar comprando' d='Shop.Theme.Actions'}</button>
{/block}