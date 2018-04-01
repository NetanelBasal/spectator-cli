const promptDirectory = require('inquirer-directory');
const path = require('path');

module.exports = function (plop) {

  const basePath = process.cwd();

  plop.setPrompt('directory', promptDirectory);

  const chooseDirAction = {
    type: 'directory',
    name: 'directory',
    message: 'Where do you want to create the component?',
    basePath: basePath
  };

  plop.setGenerator('Spectator', {
    prompts: [{
        type: 'list',
        name: 'type',
        choices: ['Component', 'Component with Host', 'Component with Custom Host', 'Directive', 'Service', 'Data Service'],
        message: 'What do u want to test? 😊'
      },
      {
        type: 'input',
        name: 'name',
        message: 'Give me a name, please 😀'
      },
    ].concat(chooseDirAction),
    actions: function (data) {

      const component = {
        type: 'add',
        skipIfExists: true,
        path: buildPath("{{'dashCase' name}}.component.spec.ts", data.directory),
        templateFile: './templates/component.tpl'
      };

      const host = {
        type: 'add',
        skipIfExists: true,
        path: buildPath("{{'dashCase' name}}.component.spec.ts", data.directory),
        templateFile: './templates/host.tpl'
      };

      const customHost = {
        type: 'add',
        skipIfExists: true,
        path: buildPath("{{'dashCase' name}}.component.spec.ts", data.directory),
        templateFile: './templates/custom-host.tpl'
      };

      const directive = {
        type: 'add',
        skipIfExists: true,
        path: buildPath("{{'dashCase' name}}.directive.spec.ts", data.directory),
        templateFile: './templates/directive.tpl'
      };

      const service = {
        type: 'add',
        skipIfExists: true,
        path: buildPath("{{'dashCase' name}}.service.spec.ts", data.directory),
        templateFile: './templates/service.tpl'
      };


      const dataService = {
        type: 'add',
        skipIfExists: true,
        path: buildPath("{{'dashCase' name}}-data.service.spec.ts", data.directory),
        templateFile: './templates/data-service.tpl'
      };

      switch (data.type) {
        case 'Component':
          return [component];
        case 'Component with Host':
          return [host];
        case 'Component with Custom Host':
          return [customHost];
        case 'Directive':
          return [directive];
        case 'Service':
          return [service];
        case 'Data Service':
          return [dataService];
      }

    }
  });

  function genPath(directory, file) {
    return path.resolve(basePath, directory, file);
  }

  function buildPath(name, baseLocalPath) {
    return `${basePath}/${baseLocalPath}/${name}`;
  }

};