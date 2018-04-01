import { {{pascalCase name}}Component } from './{{dashCase name}}.component';
import { createHostComponentFactory, SpectatorWithHost } from '@netbasal/spectator';

describe('{{pascalCase name}}Component', () => {

  let spectator: Spectator<{{pascalCase name}}Component>;
  const createHost = createHostComponentFactory({{pascalCase name}}Component);

  it('should create', () => {
    host = createHost(`<zippy title="Zippy title"></zippy>`);
    expect(spectator.component).toBeTruthy();
  });

  it('should...', () => {
      host = createHost(`<zippy title="Zippy title">Zippy content</zippy>`);

      host.click('.zippy__title');
      expect(host.query('.arrow')).toHaveText('Close');
  });

  it('should...', () => {
    host = createHost(`<zippy title="Zippy title"></zippy>`);

    host.click('.zippy__title');
    expect(host.query('.zippy__content')).toExist();

    host.click('.zippy__title');
    expect('.zippy__content').not.toExist();
  });

});