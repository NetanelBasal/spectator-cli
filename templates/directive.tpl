import { {{pascalCase name}}Directive } from './{{dashCase name}}.directive';
import { createHostComponentFactory, SpectatorWithHost } from '@netbasal/spectator';

describe('{{pascalCase name}}Directive', () => {
  let host: SpectatorWithHost<{{pascalCase name}}Directive>;

  const createHost = createHostComponentFactory({{pascalCase name}}Directive);

  it('should change the background color', () => {
    host = createHost(`<div highlight>Testing {{pascalCase name}}Directive</div>`);

    host.dispatchMouseEvent(host.element, 'mouseover');

    expect(host.element).toHaveStyle({
      backgroundColor: 'rgba(0,0,0, 0.1)'
    });

    host.dispatchMouseEvent(host.element, 'mouseout');
    expect(host.element).toHaveStyle({
      backgroundColor: '#fff'
    });
  });

});
