npm i -g typescript 

When you have a TypeScript file (e.g., `index.ts`) and you want to run it using Node.js, you need to transpile it to JavaScript first because Node.js doesn't directly run TypeScript files. To do this, you can use a TypeScript compiler like `tsc` (TypeScript Compiler). Here's what you need to do:

1. **Install TypeScript (if not already installed)**:
   If you haven't already installed TypeScript globally, you can do so with the following command:

   ```bash
   npm install -g typescript
   ```

2. **Transpile TypeScript to JavaScript**:
   Use the TypeScript compiler (`tsc`) to transpile your TypeScript file into JavaScript. Open your terminal, navigate to the directory where `index.ts` is located, and run:

   ```bash
   tsc index.ts
   ```

   This will generate a JavaScript file named `index.js`.

3. **Run the JavaScript file with Node.js**:
   Now, you can run the JavaScript file using Node.js:

   ```bash
   node index.js
   ```

This way, you can run your TypeScript code as JavaScript with Node.js. If you have multiple TypeScript files and want to compile the entire project, you can use a `tsconfig.json` configuration file to manage the compilation settings.





To get Suggestions in JS / javascript . 
One of the advantage of using a staticaly 
typed language is getting autocompletion/suggestions
while coding . 

JsDoc Comment
/**
 * @param {import('express').Request} req
 * @param {import('express').Response} res
 * @param {import('express').NextFunction} next
 */

install plugIn Also
