import { {{pascalCase name}}Component } from './{{{dashCase name}}}.component';
import { Spectator, createTestComponentFactory } from '@netbasal/spectator';

describe('{{pascalCase name}}Component', () => {

  let spectator: Spectator<{{pascalCase name}}Component>;
  const createComponent = createTestComponentFactory({{pascalCase name}}Component);

  it('should create', () => {
    spectator = createComponent();
    expect(spectator.component).toBeTruthy();
  });

  it('should...', () => {
    spectator = createComponent({ className: 'danger' });

    expect(spectator.query('button')).toHaveClass('danger');
  });

  it('should emit..', () => {
    spectator = createComponent();
    let output;
    spectator.output<{ type: string }>('click').subscribe(result => output = result);

    spectator.component.onClick({ type: 'click' });
    expect(output).toEqual({ type: 'click' });
  });

});