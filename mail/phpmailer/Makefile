PORTNAME=	phpmailer
PORTVERSION=	5.2.28
DISTVERSIONPREFIX=	v
CATEGORIES=	mail

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Full Featured Email Transfer Class for PHP
WWW=		https://github.com/PHPMailer/PHPMailer

LICENSE=	lgpl2.1
LICENSE_FILE=	${WRKSRC}/LICENSE

USE_GITHUB=	yes
GH_ACCOUNT=	PHPMailer
GH_PROJECT=	PHPMailer

NO_BUILD=	yes
NO_ARCH=	yes
USE_PHP=	yes
USES=		cpe dos2unix php
CPE_VENDOR=	phpmailer_project
SUB_FILES=	pkg-message

OPTIONS_DEFINE=	DOCS EXAMPLES

pre-patch: dos2unix

do-install:
	@${MKDIR} ${DATADIR}
.for f in PHPMailerAutoload.php class.phpmailer.php class.pop3.php \
	class.smtp.php composer.json
	${INSTALL_DATA} ${WRKSRC}/$f ${DATADIR}
.endfor
.for d in extras language
	@${MKDIR} ${DATADIR}/$d
	${INSTALL_DATA} ${WRKSRC}/$d/* ${DATADIR}/$d
.endfor
	@${MKDIR} ${DOCSDIR}
.for f in LICENSE
	${INSTALL_DATA} ${WRKSRC}/$f ${DOCSDIR}
.endfor
	@${MKDIR} ${EXAMPLESDIR}
	@cd ${WRKSRC}/examples && ${COPYTREE_SHARE} . ${EXAMPLESDIR}

.include <bsd.port.mk>
