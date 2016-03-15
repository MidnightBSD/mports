# Created by: Zhen REN <bg1tpt@gmail.com>
# $FreeBSD: head/mail/phpmailer/Makefile 402885 2015-12-03 16:40:06Z amdmi3 $
# $MidnightBSD$

PORTNAME=	phpmailer
PORTVERSION=	5.2.14
DISTVERSIONPREFIX=	v
CATEGORIES=	mail

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Full Featured Email Transfer Class for PHP

LICENSE=	lgpl2.1
LICENSE_FILE=	${WRKSRC}/LICENSE

USE_GITHUB=	yes
GH_ACCOUNT=	PHPMailer
GH_PROJECT=	PHPMailer

NO_BUILD=	yes
NO_ARCH=	yes
USE_PHP=	yes
USES=		dos2unix

SUB_FILES=	pkg-message

OPTIONS_DEFINE=	DOCS EXAMPLES

pre-patch: dos2unix

do-install:
	@${MKDIR} ${STAGEDIR}${DATADIR}
.for f in PHPMailerAutoload.php class.phpmailer.php class.pop3.php \
	class.smtp.php composer.json
	${INSTALL_DATA} ${WRKSRC}/$f ${STAGEDIR}${DATADIR}
.endfor
.for d in extras language test
	@${MKDIR} ${STAGEDIR}${DATADIR}/$d
	${INSTALL_DATA} ${WRKSRC}/$d/* ${STAGEDIR}${DATADIR}/$d
.endfor

do-install-DOCS-on:
	@${MKDIR} ${STAGEDIR}${DOCSDIR}
.for f in changelog.md README.md LICENSE
	${INSTALL_DATA} ${WRKSRC}/$f ${STAGEDIR}${DOCSDIR}
.endfor
	@cd ${WRKSRC}/docs && ${COPYTREE_SHARE} . ${STAGEDIR}${DOCSDIR}

do-install-EXAMPLES-on:
	@${MKDIR} ${STAGEDIR}${EXAMPLESDIR}
	@cd ${WRKSRC}/examples && ${COPYTREE_SHARE} . ${STAGEDIR}${EXAMPLESDIR}

.include <bsd.port.mk>
