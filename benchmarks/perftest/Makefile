PORTNAME=	perftest
DISTVERSIONPREFIX=	v
DISTVERSION=	4.4-0.7
CATEGORIES=	benchmarks

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Collection of tests for RDMA micro-benchmark
WWW=		https://github.com/linux-rdma/perftest/

LICENSE=	lgpl2.1 bsd2
LICENSE_COMB=	dual

.if !exists(/usr/lib/libibverbs.so)
IGNORE=		missing OFED user space
.endif

USES=		autoreconf libtool shebangfix

USE_GITHUB=	yes
GH_ACCOUNT=	linux-rdma

SHEBANG_FILES=	run_perftest_multi_devices

GNU_CONFIGURE=yes

.include <bsd.port.mk>
