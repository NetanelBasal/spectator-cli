import { {{pascalCase name}}Service } from './{{dashCase name}}.service';
import { createService } from '@netbasal/spectator';

describe('{{pascalCase name}}Service Without Mock', () => {
  const spectator = createService({{pascalCase name}}Service);
  // const spectator = createService({ service: {{pascalCase name}}Service, mocks: [OtherService] });

  it('should be 0', () => {
    expect(spectator.service.counter).toEqual(0);
  });

});