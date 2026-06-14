PORTNAME=	verilog-mode.el
PORTVERSION=	801
PORTREVISION=	25
CATEGORIES=	cad elisp
MASTER_SITES=	http://www.veripool.org/ftp/
PKGNAMESUFFIX=	${EMACS_PKGNAMESUFFIX}
DISTNAME=	${PORTNAME:R}-${PORTVERSION}.${PORTNAME:E}
EXTRACT_SUFX=	.gz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Emacs lisp modules for the Verilog language
WWW=		https://www.veripool.org/wiki/verilog-mode

LICENSE=	gpl3+

USES=		emacs

CONFLICTS_INSTALL=	verilog-mode.el-emacs_*

EXTRACT_CMD=	${GZCAT}
EXTRACT_BEFORE_ARGS=	#
EXTRACT_AFTER_ARGS=	> ${PORTNAME}
NO_BUILD=	yes

NO_WRKSUBDIR=	yes

PLIST_FILES=	${EMACS_SITE_LISPDIR}/${PORTNAME}

do-install:
	@${MKDIR} ${PREFIX}/${EMACS_SITE_LISPDIR}
	${INSTALL_DATA} ${WRKSRC}/${PORTNAME} ${PREFIX}/${EMACS_SITE_LISPDIR}

.include <bsd.port.mk>
