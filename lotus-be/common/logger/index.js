const winston = require('winston')

// Define the log format
const logFormat = winston.format.combine(
    winston.format.timestamp(),
    winston.format.json()
);

const logger = winston.createLogger(
    {
        level: 'info',
        transports: [new winston.transports.Console()],
        format: logFormat
    }
)



module.exports = { logger }