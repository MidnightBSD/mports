# $MidnightBSD$

PORTNAME=	libical
PORTVERSION=	1.0
CATEGORIES=	devel
MASTER_SITES=	SF/freeassociation/${PORTNAME}/${PORTNAME}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Implementation of the IETF's Calendaring and Scheduling protocols 

LICENSE_COMB=	dual
LICENSE=	mpl lgpl2.1

USES=		cmake gmake pathfix perl5
USE_PERL5=	build
USE_LDCONFIG=	yes

MAKE_JOBS_UNSAFE= yes

.include <bsd.port.pre.mk>

.if ${ARCH} == "amd64" || ${ARCH} == "ia64"
CFLAGS+=	-fPIC
.endif

post-install:
	@${STRIP_CMD} ${STAGEDIR}${PREFIX}/lib/libical*.so.1.0.0

.include <bsd.port.post.mk>
