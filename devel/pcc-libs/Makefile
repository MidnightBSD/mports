PORTNAME=	pcc-libs
PORTVERSION=	1.1.0
CATEGORIES=	devel
MASTER_SITES=	ftp://pcc.ludd.ltu.se/pub/pcc-releases/ \
		http://pcc.ludd.ltu.se/ftp/pub/pcc-releases/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Libraries for the Portable C Compiler
WWW=		http://pcc.ludd.ltu.se/

LICENSE=	BSDCOMPATIBLE bsd2 bsd3
LICENSE_COMB=	multi
LICENSE_NAME_BSDCOMPATIBLE=	BSD-style compatible licenses
LICENSE_TEXT_BSDCOMPATIBLE=	The license: BSDCOMPATIBLE (${LICENSE_NAME_BSDCOMPATIBLE}),\
	please read from the web: http://pcc.ludd.ltu.se/licenses/
LICENSE_PERMS_BSDCOMPATIBLE=	dist-mirror dist-sell pkg-mirror pkg-sell auto-accept

USES=	gmake tar:tgz
GNU_CONFIGURE=	yes

DATADIR=	${PREFIX}/lib/pcc
PORTDATA=	*

.include <bsd.port.mk>
