import { {{pascalCase name}}Component } from './{{dashCase name}}.component';
import { createHostComponentFactory, SpectatorWithHost } from '@netbasal/spectator';

@Component({ selector: 'custom-host', template: '' })
class CustomHostComponent {
  title = 'Custom HostComponent';
}

describe('{{pascalCase name}}Component', () => {
  let host: SpectatorWithHost<{{pascalCase name}}Component, CustomHostComponent>;

  const createHost = createHostComponentFactory({ component: {{pascalCase name}}Component, host: CustomHostComponent });

  it('should display the host component title', () => {
    host = createHost(`<zippy [title]="title"></zippy>`);

    expect(host.query('.zippy__title')).toHaveText('Custom HostComponent');
  });
});